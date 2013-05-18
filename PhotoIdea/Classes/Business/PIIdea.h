//
//  PIIdea.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PIIdea : NSObject

@property (nonatomic, strong) NSString *name;

@end

@interface PIIdea (Factory)

+(PIIdea *)ideaWithName:(NSString *)name;

@end