//
//  PIIdea+CoreData.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/18/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdea+CoreData.h"

@implementation PIIdea (CoreData)

+ (PIIdea *)ideaWithName:(NSString *)title
  inManagedObjectContext:(NSManagedObjectContext *)context
{
    PIIdea *idea = [NSEntityDescription insertNewObjectForEntityForName:kIdeaEntityName
                                                 inManagedObjectContext:context];
    idea.title = title;
    return idea;
}

@end
