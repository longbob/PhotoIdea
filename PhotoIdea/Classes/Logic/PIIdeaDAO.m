//
//  PIIdeaManager.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdeaDAO.h"
#import "PIIdea+CoreData.h"
#import "PIIdeaViewObject.h"

NSString *const kDocumentNameURL = @"MyIdeas.pi";

@interface UIManagedDocument (helpers)

- (BOOL)existsOnDisk;
- (BOOL)isClosed;
- (BOOL)isNormal;

@end

@interface PIIdeaDAO ()

@property (nonatomic) UIManagedDocument *document;
@property (nonatomic) NSArray *contextObservers;

@end

@implementation PIIdeaDAO

#pragma mark - Singleton

+ (instancetype)sharedDAO
{
    static PIIdeaDAO *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [self new];
    });
    return shared;
}

#pragma mark - Initialization

- (instancetype)init
{
    if (self = [super init]) {
        
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory
                                                             inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:kDocumentNameURL];
        
        _document = [[UIManagedDocument alloc] initWithFileURL:url];
        
        _document.persistentStoreOptions = @{NSMigratePersistentStoresAutomaticallyOption: @YES,
                                                   NSInferMappingModelAutomaticallyOption: @YES};
    }
    
    return self;
}

#pragma mark - Document

- (void)performWithDocument:(OnDocumentReady)onDocumentReady
{
    void (^onDocumentDidLoad)(BOOL) = ^(BOOL success) {
        if (success) {
            onDocumentReady(self.document);
        }
    };
    
    if (![self.document existsOnDisk]) {
        [self.document saveToURL:self.document.fileURL
                forSaveOperation:UIDocumentSaveForCreating
               completionHandler:onDocumentDidLoad];
    } else if ([self.document isClosed]) {
        [self.document openWithCompletionHandler:onDocumentDidLoad];
    } else if ([self.document isNormal]) {
        onDocumentDidLoad(YES);
    }
}

- (void)closeDocument:(OnDocumentClosed)onDocumentClosed
{
    [self.document closeWithCompletionHandler:^(BOOL success) {
        if (success) {
            onDocumentClosed();
        }
    }];
}

#pragma mark - PIIdea Management

- (void)addIdea:(PIIdeaViewObject *)ideaVO
{
    [self performWithDocument:^(UIManagedDocument *document) {
        [PIIdea ideaWithTitle:ideaVO.title
                      details:ideaVO.details inManagedObjectContext:document.managedObjectContext];
    }];
}


@end

@implementation UIManagedDocument (helpers)

-(BOOL)existsOnDisk
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[self.fileURL path]];
}

-(BOOL)isClosed
{
    return self.documentState == UIDocumentStateClosed;
}

-(BOOL)isNormal
{
    return self.documentState == UIDocumentStateNormal;
}

@end
