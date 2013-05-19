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

+ (PIIdeaViewObject *)ideaWithName:(NSString *)name
{
    PIIdeaViewObject* idea = [[PIIdeaViewObject alloc]init];
    idea.name = name;
    return idea;
}
@end
