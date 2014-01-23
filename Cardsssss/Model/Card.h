//
//  Card.h
//  Cardsssss
//
//  Created by admin on 1/15/14.
//  Copyright (c) 2014 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString * contents;
@property (nonatomic,getter = isFaceUp) BOOL faceUp;
@property (nonatomic,getter = isUnplayable) BOOL unplayable;

- (int) match:(NSArray *) otherCards;

@end
