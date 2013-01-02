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


-(id) initWithShipImage {
    if ((self = [super initWithFile:@"ship.png"])) {
        
        
        
        [self scheduleUpdate];
    }
    return self;
}


-(void) update:(ccTime)delta {
    //keep creating new bullets
    Bullet *bullet = [Bullet bulletWithShip:self];
    
    //Add the bullets to the ship's parent
    CCNode *gameScene = [self parent];
    [gameScene addChild:bullet z:0 tag:GameSceneNodeTagBullet];
}



@end
