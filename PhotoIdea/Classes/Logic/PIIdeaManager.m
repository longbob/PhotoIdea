//
//  PIIdeaManager.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdeaManager.h"

@interface PIIdeaManager ()

@property (nonatomic, strong) NSMutableArray *ideas;

@end


@implementation PIIdeaManager

#pragma mark - singleton

+ (PIIdeaManager *)sharedInstance
{
    static PIIdeaManager *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[PIIdeaManager alloc]init];
    });
    return shared;
}

#pragma mark - idea management

- (void)addIdea:(PIIdea *)idea
{
    [self.ideas addObject:idea];
}

@end
