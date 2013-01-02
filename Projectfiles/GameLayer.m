//
//  GameLayer.m
//  SpritesInDepth
//
//  Created by Andrew Helmkamp on 1/1/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "Bullet.h"
#import "Ship.h"
#import "ParallaxBackground.h"



@implementation GameLayer

static GameLayer *sharedGameLayer;

+(GameLayer*) sharedGameLayer {
    NSAssert(sharedGameLayer != nil, @" instance not yet initialized!");
    return sharedGameLayer;
}

+(id)scene {
    CCScene *scene = [CCScene node];
    GameLayer *layer = [GameLayer node];
    [scene addChild:layer];
    return scene;
}

-(id) init {
    if ((self = [super init])) {
        sharedGameLayer = self;
        
        //Make sure the screen isn't shining through
        glClearColor(1, 1, 1, 1);
        
        //load the artwork upfront
        CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [frameCache addSpriteFramesWithFile:@"game-art.plist"];
        
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        ParallaxBackground* background = [ParallaxBackground node];
        [self addChild:background z:-1];
        
/*        //Add the batch node
        CCSpriteBatchNode *batch = [CCSpriteBatchNode batchNodeWithFile:@"bullet.png"];
        [self addChild:batch z:1 tag:GameSceneNodeTagBulletSpriteBatch];
        
        //Create a number of bullets up front and reuse them whenever necessary.
        for (int i = 0; i < 400; i++) {
            Bullet* bullet = [Bullet bullet];
            bullet.visible = NO;
            [batch addChild:bullet];
        } */
    }
    return self;
}

-(void)dealloc {
    sharedGameLayer = nil;
}

-(CCSpriteBatchNode*) bulletSpriteBatch {
    CCNode* node = [self getChildByTag:GameSceneNodeTagBulletSpriteBatch];
    NSAssert([node isKindOfClass:[CCSpriteBatchNode class]], @"not a SpriteBatch");
    return (CCSpriteBatchNode*)node;
}

//-(void) update:(ccTime)delta {
//    Bullet *bullet = [Bullet bulletWithShip:self];
//    [[[GameLayer sharedGameLayer] bulletSpriteBatch] addChild:bullet z:0 tag:GameSceneNodeTagBullet];
//}

-(void)shootBulletFromShip:(Ship *)ship {
    CCArray* bullets = [self.bulletSpriteBatch children];
    
    CCNode* node = [bullets objectAtIndex:nextInactiveBullet];
    NSAssert([node isKindOfClass:[Bullet class]], @"not a bullet!");
    
    Bullet* bullet = (Bullet*)node;
    [bullet shootBulletFromShip:ship];
    
    nextInactiveBullet++;
    if (nextInactiveBullet >= bullets.count) {
        nextInactiveBullet = 0;
    }
}


@end
