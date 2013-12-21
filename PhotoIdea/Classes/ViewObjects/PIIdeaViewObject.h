//
//  PIIdea.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PIIdeaViewObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *details;

@end

@interface PIIdeaViewObject (Factory)

+(PIIdeaViewObject *)ideaWithTitle:(NSString *)title;
+(PIIdeaViewObject *)ideaWithTitle:(NSString *)title details:(NSString *)details;


@end