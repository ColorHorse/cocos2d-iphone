//
//  CCCow.h
//  Mozzle
//
//  Created by macbook on 06/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"


//CCCow with batch node, you can add it on all containers
@interface CCCowBN : CCNode {
	CCSprite *head,*body,*tail;
	float headSpeed,tailSpeed,headAngle,tailAngle;
}
-(void)tick:(ccTime)dt;
@end



//CCCow with nested CCSprites (best performances for multiple instances), you can add it only on CCSpriteBatchNodes
@interface CCCow : CCSprite {
	CCSprite *head,*body,*tail;
	float headSpeed,tailSpeed,headAngle,tailAngle;
}
-(void)tick:(ccTime)dt;
@end