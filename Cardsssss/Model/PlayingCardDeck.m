//
//  PlayingCardDeck.m
//  Cardsssss
//
//  Created by admin on 1/15/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Card.h"

@interface PlayingCardDeck ()

@end

@implementation PlayingCardDeck

-(id) init
{
    self = [super init];
    
    if(self){
    
        for(NSString * suit in [PlayingCard suits])
        {
            for(int rank = 1 ; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard * card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
    }
    
    return self;
}


@end
