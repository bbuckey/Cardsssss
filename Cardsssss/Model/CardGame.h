//
//  CardGame.h
//  Cardsssss
//
//  Created by admin on 1/16/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"


@interface CardGame : NSObject
@property (readonly, nonatomic) NSUInteger score;
@property (nonatomic) NSUInteger numberOfCards;

- (id)initCardGameWithCardList:(Deck *) deck
                        amount:(NSUInteger) amount;

- (Card *) getCardAtIndex:(int)index;

- (BOOL) checkForCardMatch:(int)index isMatch3:(BOOL)isMatch3;

- (BOOL) checkForMoreThenTwoCardsFlipped;

- (void) flipAllPlayableCardsFaceDown;

- (void) resetAllCardsForPlayableAndFaceDown;

- (NSString*) currentCardsPicked:(BOOL)isMatch isMatch3:(BOOL)isMatch3;

- (BOOL) checkForTwoCardsFlipped;

- (BOOL) checkForThreeCardsFlipped;

@end
