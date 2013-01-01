//
//  Bullet.h
//  SpritesInDepth
//
//  Created by Andrew Helmkamp on 1/1/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@class Ship;

@interface Bullet : CCSprite {
    CGPoint velocity;
    float outsideScreen;
}

@property (readwrite, nonatomic) CGPoint velocity;

+(id)bullet;
-(void) shootBulletFromShip:(Ship*)ship;


@end
