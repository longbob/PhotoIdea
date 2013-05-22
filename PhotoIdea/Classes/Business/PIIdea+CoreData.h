//
//  PIIdea+CoreData.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/18/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdea.h"

#define kIdeaEntityName @"PIIdea"
#define kTitleKey @"title"

@interface PIIdea (CoreData)

+ (PIIdea *)ideaWithName:(NSString *)title
  inManagedObjectContext:(NSManagedObjectContext *)context;
@end
