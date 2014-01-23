//
//  CardGame.m
//  Cardsssss
//
//  Created by admin on 1/16/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import "CardGame.h"
#import "PlayingCard.h"
#import "Card.h"
#import "Deck.h"

@interface CardGame()
@property (readwrite, nonatomic) NSUInteger score;
@property (strong,nonatomic) NSMutableArray * cardList;
@property (strong,nonatomic) NSMutableArray * pickedCards;
@end

@implementation CardGame

- (NSMutableArray *) cardList{
    if(!_cardList){
        _cardList = [[NSMutableArray alloc]init];
    }
    return _cardList;
}

- (id)initCardGameWithCardList:(Deck *) deck
                        amount:(NSUInteger) amount{
    self = [super init];
    if(amount <= [deck numberOfCardsInDeck]){
        self.numberOfCards = amount;
        for(int i = 0; i < amount; i++ ){
            Card * card = [deck darwRandomCard];
            if(!card){
                self = nil;
            } else {
                self.cardList[i] = card;
            }
        }
    }
    return self;
}


- (NSMutableArray *) pickedCards{
    if(!_pickedCards){
        _pickedCards = [[NSMutableArray alloc]init];
    }
    return _pickedCards;
}

- (PlayingCard *) getCardAtIndex:(int)index {
    PlayingCard * card = [self.cardList count] >= index ? self.cardList[index] : nil;
    return card;
}

- (BOOL) checkForCardMatch:(int)index isMatch3:(BOOL)isMatch3;{
    BOOL isMatch = NO;
    PlayingCard * card = [self getCardAtIndex:index];
    card.faceUp = !card.isFaceUp;
    if(card.isFaceUp) {
       [self.pickedCards addObject:card.contents];
    } else {
       [self.pickedCards removeObject:card.contents];
    }
    int tempScore = 0;
    
    NSMutableArray * allCards = [[NSMutableArray alloc]init];
    
    if(card && !card.isUnplayable && card.isFaceUp && ((isMatch3 && [self.pickedCards count] > 2) || (!isMatch3 && [self.pickedCards count] > 1))){
            for(PlayingCard * otherCard in self.cardList){
                if(!otherCard.isUnplayable && otherCard.isFaceUp && card != otherCard){
                    [allCards addObject:otherCard];
            }
        }
        tempScore = [card match:allCards isMatch3:isMatch3];
        if(tempScore > 0){
            isMatch = YES;
            for (PlayingCard *pc in allCards){
                pc.unplayable = YES;
                card.unplayable = YES;
            }
        }
    }
    self.score = tempScore > 0 ? self.score + tempScore: self.score - 2;
    
    return isMatch;
}


- (BOOL) checkForMoreThenTwoCardsFlipped{
    return [self.pickedCards count] >= 2;
}

- (BOOL) checkForTwoCardsFlipped{
    return [self.pickedCards count] == 2;
}

- (BOOL) checkForThreeCardsFlipped{
    return [self.pickedCards count] == 3;
}

- (void) flipAllPlayableCardsFaceDown{
    for(PlayingCard * otherCard in self.cardList){
        if(!otherCard.isUnplayable && otherCard.isFaceUp){
            otherCard.faceUp = !otherCard.isFaceUp;
        }
    }  
}

- (void) resetAllCardsForPlayableAndFaceDown{
    for(PlayingCard * otherCard in self.cardList){
        otherCard.faceUp = NO;
        otherCard.unplayable = NO;
    }
    [self.pickedCards removeAllObjects];
    
}


- (NSString*) currentCardsPicked:(BOOL)isMatch isMatch3:(BOOL)isMatch3{
    NSString* theCards = @"NO MATCH" ;
    
    if (isMatch) {
        for(Card * card in self.pickedCards){
            theCards = [NSString stringWithFormat:@"The match is: %@",[self.pickedCards componentsJoinedByString:@","]];
        }
    } else {
        for(Card * card in self.pickedCards){
            theCards = [NSString stringWithFormat:@"The cards %@ did not match",[self.pickedCards componentsJoinedByString:@","]];
        }
    }
    
    if(([self.pickedCards count] > 2 && isMatch3) || ([self.pickedCards count] > 1 && !isMatch3))
    {
        [self.pickedCards removeAllObjects];
    }

    return theCards;
}


@end
