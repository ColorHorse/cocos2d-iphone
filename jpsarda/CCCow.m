//
//  CCCow.m
//  Mozzle
//
//  Created by macbook on 06/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCCow.h"
#import "Handy.h"

@implementation CCCowBN
- (id) init {
	self = [super init];
	if (self != nil) {
		CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"cow.png"];
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"cow.plist" texture:texture];
		
		head = [CCSprite spriteWithSpriteFrameName:@"cowhead.png"];
		body = [CCSprite spriteWithSpriteFrameName:@"cowbody.png"];
		tail = [CCSprite spriteWithSpriteFrameName:@"cowtail.png"];
		
		CCSpriteBatchNode *batch=[CCSpriteBatchNode batchNodeWithFile:@"cow.png"];
		[self addChild:batch];
		
		[batch addChild:tail];
		[batch addChild:body];
		[batch addChild:head];
		
		tail.anchorPoint=ccp(0.0f,0.8f);
		head.anchorPoint=ccp(0.5f,0.3f);
		
		tail.position=ccp(60.0f,28.0f);
		head.position=ccp(-59.0f,48.0f);
		
		
		headSpeed=5.0f+RAND11*3.0f;
		tailSpeed=7.0f+RAND11*4.0f;
		headAngle=tailAngle=0;
		
		[self tick:0];
		
		[self schedule:@selector(tick:)];
	}
	return self;
}
-(void)tick:(ccTime)dt {
	headAngle+=dt*headSpeed;
	tailAngle+=dt*tailSpeed;
	
	head.rotation=20*sin(headAngle);
	tail.rotation=-55+35*sin(tailAngle);
}
@end


@implementation CCCow
+(id)node {
    // CCCow is a useless CCSprite (texture rect size is zero)
    // The goal being to be able to add it to a batch node (with all its CCSprite childs)
    CCCow *ret=[[CCCow alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"cow.png"] rect:CGRectZero];
    return [ret autorelease];
}
- (id) init {
	self = [super init];
	if (self != nil) {
		CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"cow.png"];
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"cow.plist" texture:texture];
		
		head = [CCSprite spriteWithSpriteFrameName:@"cowhead.png"];
		body = [CCSprite spriteWithSpriteFrameName:@"cowbody.png"];
		tail = [CCSprite spriteWithSpriteFrameName:@"cowtail.png"];
		
		[self addChild:tail];
		[self addChild:body];
		[self addChild:head];
		
		tail.anchorPoint=ccp(0.0f,0.8f);
		head.anchorPoint=ccp(0.5f,0.3f);
		
		tail.position=ccp(60.0f,28.0f);
		head.position=ccp(-59.0f,48.0f);
		
		
		headSpeed=5.0f+RAND11*3.0f;
		tailSpeed=7.0f+RAND11*4.0f;
		headAngle=tailAngle=0;
		
		[self tick:0];
		
		[self schedule:@selector(tick:)];
	}
	return self;
}
-(void)tick:(ccTime)dt {
	headAngle+=dt*headSpeed;
	tailAngle+=dt*tailSpeed;
	
	head.rotation=20*sin(headAngle);
	tail.rotation=-55+35*sin(tailAngle);
}
@end
