//
//  ParallaxBackground.h
//  SpritesInDepth
//
//  Created by Andrew Helmkamp on 1/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ParallaxBackground : CCNode {
    CCSpriteBatchNode* spriteBatch;
    int numSprites;
    
    NSMutableArray* speedFactors;
    float scrollSpeed;
}

@end
