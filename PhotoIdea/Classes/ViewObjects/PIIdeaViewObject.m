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

+ (PIIdeaViewObject *)ideaWithTitle:(NSString *)title
{
    PIIdeaViewObject* idea = [[PIIdeaViewObject alloc]init];
    idea.title = title;
    return idea;
}

+ (PIIdeaViewObject *)ideaWithTitle:(NSString *)title details:(NSString *)details
{
    PIIdeaViewObject *idea = [PIIdeaViewObject ideaWithTitle:title];
    idea.details = details;
    return idea;
}

@end
