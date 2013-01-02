//
//  GameLayer.h
//  SpritesInDepth
//
//  Created by Andrew Helmkamp on 1/1/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Ship;

typedef enum {
    GameSceneNodeTagBullet = 1,
    GameSceneNodeTagBulletSpriteBatch,
} GameSceneNodeTags;

@interface GameLayer : CCLayer {
    NSUInteger nextInactiveBullet;
}

+(id)scene;
+(GameLayer*) sharedGameLayer;
-(CCSpriteBatchNode*) bulletSpriteBatch;
-(void) shootBulletFromShip:(Ship*)ship;

@end
