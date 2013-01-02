//
//  Bullet.m
//  SpritesInDepth
//
//  Created by Andrew Helmkamp on 1/1/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"
#import "Ship.h"


@interface Bullet (PrivateMethods)
-(id)initWithShip:(Ship*)ship;
-(id)initWithBulletImage;
@end



@implementation Bullet

@synthesize velocity;


+(id) bullet {
    return [[self alloc] initWithBulletImage];
}

-(id) initWithBulletImage {
    if ((self = [super initWithSpriteFrameName:@"bullet.png"])) {
        
    }
    return self;
}


-(void) shootBulletFromShip:(Ship*)ship {
    float spread = (CCRANDOM_0_1() - 0.5f) * 0.5f;
    velocity = CGPointMake(1, spread);
    
    outsideScreen = [CCDirector sharedDirector].winSize.width;
    self.position = CGPointMake(ship.position.x + ship.contentSize.width * 0.5f, ship.position.y);
    self.visible = YES;
    
    //[self scheduleUpdate];
}

-(void) update:(ccTime)delta {
    //update position of the bullet
    //multiply the velocity by the time since the last update was called
    //this ensures same bullet velocity even if framerate drops
    self.position = ccpAdd(self.position, ccpMult(velocity, delta));
    
    //delete the bullet if it leaves the screen
    if (self.position.x > outsideScreen) {
        self.visible = NO;
       // [self unscheduleUpdate];
    }
}



@end
