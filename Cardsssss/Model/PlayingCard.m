//
//  PlayingCard.m
//  Cardsssss
//
//  Created by admin on 1/15/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

+ (NSString *) getValueFromRank:(NSUInteger)rank;

@end

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *) ranks {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSArray *) suits{
    return @[@"♦︎",@"♥︎",@"♠︎",@"♣︎"];
}

+ (NSUInteger)maxRank { return [[PlayingCard ranks] count]-1; }

+ (NSString *) getValueFromRank:(NSUInteger)rank {
    if(rank <= [PlayingCard maxRank]){
        return [PlayingCard ranks][rank];
    } else {
        return [PlayingCard ranks][0];
    }
    
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard ranks];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard suits] containsObject:suit]) {
        _suit = suit;
    } }

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void) setRank:(NSUInteger)rank {
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}


- (NSUInteger) match:(NSArray *) otherCards isMatch3:(BOOL)isMatch3{
    int score = 0;
    
    if(otherCards){
        for(PlayingCard * otherCard in otherCards){
                if (otherCard.rank == self.rank && self != otherCard){
                score += 4;
            }
            if(isMatch3 && score < 8){
                score = 0;
            }
            
            for(PlayingCard * otherCard in otherCards){
                 if([otherCard.suit isEqualToString:self.suit] && self != otherCard){
                    score += 3;
                }
            }
            
            if(isMatch3 && score < 6){
                score = 0;
            }
            
        }
    }
    
    return score;
}

@end
