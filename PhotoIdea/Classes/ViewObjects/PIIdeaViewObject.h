//
//  PIIdea.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

@interface PIIdeaViewObject : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *details;

@end

@interface PIIdeaViewObject (Factory)

+(instancetype)ideaWithTitle:(NSString *)title;
+(instancetype)ideaWithTitle:(NSString *)title details:(NSString *)details;


@end