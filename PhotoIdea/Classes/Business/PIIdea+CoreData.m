//
//  PIIdea+CoreData.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/18/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdea+CoreData.h"

NSString *const kIdeaEntityName = @"PIIdea";
NSString *const kTitleKey = @"title";

@implementation PIIdea (CoreData)

+ (instancetype)ideaWithTitle:(NSString *)title inManagedObjectContext:(NSManagedObjectContext *)context
{
    PIIdea *idea = [NSEntityDescription insertNewObjectForEntityForName:kIdeaEntityName
                                                 inManagedObjectContext:context];
    idea.title = title;
    return idea;
}

+ (instancetype)ideaWithTitle:(NSString *)title details:(NSString *)details inManagedObjectContext:(NSManagedObjectContext *)context
{
    PIIdea *idea = [PIIdea ideaWithTitle:title inManagedObjectContext:context];
    idea.details = details;
    return idea;
}
@end
