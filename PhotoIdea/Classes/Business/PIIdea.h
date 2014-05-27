//
//  PIIdea.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/28/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface PIIdea : NSManagedObject

@property (nonatomic) NSString * title;
@property (nonatomic) NSString * details;

@end
