//
//  PIIdeaManager.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PIIdea;

@interface PIIdeaManager : NSObject

+ (PIIdeaManager *)sharedInstance;

- (void) addIdea:(PIIdea *)idea;

@end
