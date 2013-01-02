//
//  ParallaxBackground.m
//  SpritesInDepth
//
//  Created by Andrew Helmkamp on 1/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ParallaxBackground.h"


@implementation ParallaxBackground




-(id) init {
    if ((self = [super init])) {
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        //get the spritesheet by adding it to the cache
        CCTexture2D* gameArtTexture = [[CCTextureCache sharedTextureCache] addImage:@"game-art.pvr.ccz"];
        
        //create the background spritebatch
        spriteBatch = [CCSpriteBatchNode batchNodeWithTexture:gameArtTexture];
        [self addChild:spriteBatch];
        
        numSprites = 7;
        
        //add the 6 different layer objects and position them on the screen
        for (int i = 0; i < numSprites; i++) {
            NSString* frameName = [NSString stringWithFormat:@"bg%i.png", i];
            CCSprite* sprite = [CCSprite spriteWithSpriteFrameName:frameName];
            //sprite.anchorPoint = CGPointMake(0, 0.5f);
            sprite.position = CGPointMake(screenSize.width/2, screenSize.height/2);
            [spriteBatch addChild:sprite z:i];
            
            scrollSpeed = 1.0f;
            //[self scheduleUpdate];
        }
    }
    return self;
}








@end
