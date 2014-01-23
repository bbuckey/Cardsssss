//
//  CardGameViewController.m
//  Cardsssss
//
//  Created by admin on 1/15/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Card.h"
#import "CardGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardGame * game;
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@property (nonatomic) int flipedCardCount;
@property (weak, nonatomic) IBOutlet UISwitch *gameSwitch;
@property (nonatomic) BOOL changeCardGame;
@end

@implementation CardGameViewController

- (void) setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    if(self.game){
        for(UIButton *cardButton in self.cardButtons){
            Card * card = [self.game getCardAtIndex:[self.cardButtons indexOfObject:cardButton]];
            [cardButton setTitle:card.contents forState:UIControlStateSelected];
        }
    }
    
}

- (CardGame *) game{
    if(!_game){
        _game = [[CardGame alloc]initCardGameWithCardList:[[PlayingCardDeck alloc]init] amount:[self.cardButtons count]];
    }
    return _game;
}

- (void)setFlipCount:(int)flipCount
{
        _flipCount = flipCount;
}

- (IBAction)flipCard:(UIButton *)sender {
    BOOL matched = NO;
    matched =
        [self.game checkForCardMatch:[self.cardButtons indexOfObject:sender] isMatch3:!self.gameSwitch.isOn];
    if(matched){
        self.flipLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score] ;
        self.matchLabel.text = [self.game currentCardsPicked:matched isMatch3:!self.gameSwitch.isOn];
    } else if([self.game checkForMoreThenTwoCardsFlipped]){
        if(([self.game checkForThreeCardsFlipped] && !self.gameSwitch.isOn) || ([self.game checkForTwoCardsFlipped] && self.gameSwitch.isOn) ) {
            [self.game flipAllPlayableCardsFaceDown];
          //  [NSThread sleepForTimeInterval:1.0f];
        }
        self.matchLabel.text = [self.game currentCardsPicked:matched isMatch3:!self.gameSwitch.isOn];
    }
    
    [self updateUI];
    self.flipCount++;
}

- (void) updateUI{
    
    for(UIButton *button in self.cardButtons){
        Card * card = [self.game getCardAtIndex:[self.cardButtons indexOfObject:button]];
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        button.selected = card.isFaceUp;
        button.enabled = !card.isUnplayable;
        button.alpha = card.isUnplayable ? .3 : 1.0;
    }
}

- (IBAction)theGameSwitch:(id)sender {
    if(self.gameSwitch.isOn){
        self.gameLabel.text = @"2 Match Game";
    }else {
        self.gameLabel.text = @"3 Match Game";
    }
    self.game = nil;
    if(self.game){
        for(UIButton *cardButton in self.cardButtons){
            Card * card = [self.game getCardAtIndex:[self.cardButtons indexOfObject:cardButton]];
            [cardButton setTitle:card.contents forState:UIControlStateSelected];
        }
       [self updateUI];
    }
}


@end

