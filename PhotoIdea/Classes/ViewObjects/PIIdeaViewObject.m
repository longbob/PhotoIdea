//
//  PIIdea.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdeaViewObject.h"

@implementation PIIdeaViewObject

#pragma mark - Factory

+ (instancetype)ideaWithTitle:(NSString *)title
{
    PIIdeaViewObject* idea = [PIIdeaViewObject new];
    idea.title = title;
    return idea;
}

+ (instancetype)ideaWithTitle:(NSString *)title details:(NSString *)details
{
    PIIdeaViewObject *idea = [PIIdeaViewObject ideaWithTitle:title];
    idea.details = details;
    return idea;
}

@end
