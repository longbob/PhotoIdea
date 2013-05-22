//
//  PIIdeaManager.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PIIdeaViewObject;

typedef void(^OnDocumentReady)(UIManagedDocument *document);

@interface PIIdeaManager : NSObject

+ (PIIdeaManager *)sharedInstance;

- (void)performWithDocument:(OnDocumentReady)onDocumentReady;

- (void)addIdea:(PIIdeaViewObject *)idea;

@property (nonatomic, strong) UIManagedDocument *document;
@property (nonatomic, strong, readonly) NSArray *ideas;
@end
