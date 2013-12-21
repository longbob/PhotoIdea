//
//  PIIdea.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/28/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PIIdea : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * details;

@end
