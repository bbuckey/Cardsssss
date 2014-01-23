//
//  Deck.h
//  Cardsssss
//
//  Created by admin on 1/15/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard:(Card *)card atTop:(BOOL) atTop;
- (Card *) darwRandomCard;
- (Card *) getRandomCard;
- (NSUInteger) numberOfCardsInDeck;

@end
