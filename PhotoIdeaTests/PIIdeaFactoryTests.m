//
//  PIIdeaFactoryTests.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdeaFactoryTests.h"
#import "PIIdeaViewObject.h"

@implementation PIIdeaFactoryTests

- (void) testIdeaWithName
{
    NSString *name = @"Name of the idea";
    PIIdeaViewObject *idea = [PIIdeaViewObject ideaWithTitle:name];

    STAssertNotNil(idea,
                   @"idea should not be nil");
    STAssertTrue([idea.title isEqualToString:name],
                 [NSString stringWithFormat:@"Name should be: %@",name]);
}

@end
