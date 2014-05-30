//
//  PIIdeaManager.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

@class PIIdeaViewObject;

typedef void(^OnDocumentReady)(UIManagedDocument *document);
typedef void(^OnDocumentClosed)();

@interface PIIdeaDAO : NSObject

+ (instancetype)sharedDAO;

- (void)performWithDocument:(OnDocumentReady)onDocumentReady;
- (void)closeDocument:(OnDocumentClosed)onDocumentClosed;

- (void)addIdea:(PIIdeaViewObject *)idea;

@end
