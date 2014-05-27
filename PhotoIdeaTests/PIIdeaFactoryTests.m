//
//  PIIdeaFactoryTests.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdeaViewObject.h"

#import <SenTestingKit/SenTestingKit.h>

@interface PIIdeaFactoryTests : SenTestCase

@end

@implementation PIIdeaFactoryTests

- (void) testIdeaWithName
{
    NSString *name = @"Name of the idea";
    PIIdeaViewObject *idea = [PIIdeaViewObject ideaWithTitle:name];

    STAssertTrue([idea.title isEqualToString:name], [NSString stringWithFormat:@"Name should be: %@",name]);
}

@end
