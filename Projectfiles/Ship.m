//
//  Ship.m
//  SpritesInDepth
//
//  Created by Andrew Helmkamp on 1/1/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Ship.h"
#import "GameLayer.h"
#import "Bullet.h"


@implementation Ship

+(id)ship {
    return [[self alloc] initWithShipImage];
}

-(id) initWithShipImage {
    if ((self = [super initWithSpriteFrameName:@"ship.png"])) {
        
        NSString* shipAnimName = @"ship-anim";
        CCAnimation* anim = [CCAnimation animationWithFrames:shipAnimName frameCount:5 delay:0.08f];
        
        //run the animation
        CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate];
        [self runAction:repeat];
        
        //call update for every frame
        [self scheduleUpdate];
    }
    return self;
}


-(void) update:(ccTime)delta {
    //shooting is relayed to the Game scene
    [[GameLayer sharedGameLayer] shootBulletFromShip:self];
}



@end
