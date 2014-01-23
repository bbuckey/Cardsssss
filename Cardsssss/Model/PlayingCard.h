//
//  PlayingCard.h
//  Cardsssss
//
//  Created by admin on 1/15/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)suits;

+ (NSArray *)ranks;

+ (NSUInteger)maxRank;

- (NSUInteger) match:(NSArray *) otherCards isMatch3:(BOOL)isMatch3;

@end
