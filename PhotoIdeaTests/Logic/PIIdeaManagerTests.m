//
//  PIIdeaManagerTests.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "PIIdeaManager.h"
#import "PIIdeaViewObject.h"

@interface PIIdeaManagerTests : SenTestCase

@property (nonatomic) PIIdeaManager *manager;

@end


@implementation PIIdeaManagerTests

- (void)setUp
{
    self.manager = [PIIdeaManager sharedManager];
}

- (void)tearDown
{
    self.manager = nil;
}

@end
