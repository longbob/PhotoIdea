//
//  PIIdea+CoreData.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/18/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdea.h"

extern NSString *const kIdeaEntityName;
extern NSString *const kTitleKey;

@interface PIIdea (CoreData)

+ (instancetype)ideaWithTitle:(NSString *)title
       inManagedObjectContext:(NSManagedObjectContext *)context;

+ (instancetype)ideaWithTitle:(NSString *)title
                      details:(NSString *)details
       inManagedObjectContext:(NSManagedObjectContext *)context;

@end
