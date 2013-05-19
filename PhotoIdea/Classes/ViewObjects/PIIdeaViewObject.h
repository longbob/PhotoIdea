//
//  PIIdea.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PIIdeaViewObject : NSObject

@property (nonatomic, strong) NSString *name;

@end

@interface PIIdeaViewObject (Factory)

+(PIIdeaViewObject *)ideaWithName:(NSString *)name;

@end