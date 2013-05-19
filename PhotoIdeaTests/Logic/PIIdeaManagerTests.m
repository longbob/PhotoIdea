//
//  PIIdeaManagerTests.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdeaManagerTests.h"
#import "PIIdeaManager.h"
#import "PIIdeaViewObject.h"
@implementation PIIdeaManagerTests

- (void)setUp
{
    self.manager = [PIIdeaManager sharedInstance];
}

- (void)tearDown
{
    self.manager = nil;
}

@end
