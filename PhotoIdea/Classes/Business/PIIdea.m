//
//  PIIdea.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdea.h"

@implementation PIIdea

#pragma mark - Factory

+ (PIIdea *)ideaWithName:(NSString *)name
{
    PIIdea* idea = [[PIIdea alloc]init];
    idea.name = name;
    return idea;
}
@end
