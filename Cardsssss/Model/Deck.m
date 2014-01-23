//
//  Deck.m
//  Cardsssss
//
//  Created by admin on 1/15/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import "Deck.h"


@interface Deck()
@property (strong,nonatomic) NSMutableArray * cards;
@end

@implementation Deck


-(NSMutableArray *) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(void) addCard:(Card *) card atTop:(BOOL) atTop
{
    if(card){
        if(atTop){
            [self.cards insertObject:card atIndex:0];
        } else {
            [self.cards addObject:card];
        }
    }
    
}

- (Card *) darwRandomCard
{
    Card * randomCard = nil;
    if(self.cards.count){
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

- (Card *) getRandomCard
{
    Card * randomCard = nil;
    if(self.cards.count){
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
    }
    return randomCard;
}

- (NSUInteger) numberOfCardsInDeck
{
    return [self.cards count];
}

@end
