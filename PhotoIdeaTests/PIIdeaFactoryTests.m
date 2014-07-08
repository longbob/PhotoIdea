//
//  PIIdeaFactoryTests.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

@import XCTest;

#import "PIIdeaViewObject.h"

@interface PIIdeaFactoryTests : XCTestCase

@end

@implementation PIIdeaFactoryTests

- (void) testIdeaWithName
{
    NSString *name = @"Name of the idea";
    PIIdeaViewObject *idea = [PIIdeaViewObject ideaWithTitle:name];

    XCTAssertTrue([idea.title isEqualToString:name], @"Name should be: %@",name);
}

@end
