//
//  PIIdeaManager.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIIdeaManager.h"
#import <CoreData/CoreData.h>
#import "PIIdea+CoreData.h"
#import "PIIdeaViewObject.h"

#define kDocumentNameURL @"MyIdeas.pi"

@interface PIIdeaManager ()

- (void)objectsDidChange:(NSNotification *)notification;
- (void)contextDidSave:(NSNotification *)notification;

@property (nonatomic) UIManagedDocument *document;

@end


@implementation PIIdeaManager

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static PIIdeaManager *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[PIIdeaManager alloc]init];
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
        
        self.document = [[UIManagedDocument alloc] initWithFileURL:url];
        
        // Set our document up for automatic migrations
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @YES,
                                 NSInferMappingModelAutomaticallyOption: @YES};
        self.document.persistentStoreOptions = options;
        
        [self registerForObjectContextNotification];
    }
    
    return self;
}

- (void)registerForObjectContextNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(objectsDidChange:)
                                                 name:NSManagedObjectContextObjectsDidChangeNotification
                                               object:self.document.managedObjectContext];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(contextDidSave:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:self.document.managedObjectContext];
}

#pragma mark - Document

- (void)performWithDocument:(OnDocumentReady)onDocumentReady
{
    void (^OnDocumentDidLoad)(BOOL) = ^(BOOL success) {
        onDocumentReady(self.document);
    };
    
    if (![[NSFileManager defaultManager]fileExistsAtPath:[self.document.fileURL path]]) {
        [self.document saveToURL:self.document.fileURL
                forSaveOperation:UIDocumentSaveForCreating
               completionHandler:OnDocumentDidLoad];
    } else if (self.document.documentState == UIDocumentStateClosed) {
        [self.document openWithCompletionHandler:OnDocumentDidLoad];
    } else if (self.document.documentState == UIDocumentStateNormal) {
        OnDocumentDidLoad(YES);
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
        [PIIdea ideaWithTitle:ideaVO.title inManagedObjectContext:document.managedObjectContext];
    }];
}

#pragma mark - NSNotification

- (void)objectsDidChange:(NSNotification *)notification
{
#ifdef DEBUG
    NSLog(@"NSManagedObjects did change.");
#endif
}

- (void)contextDidSave:(NSNotification *)notification
{
#ifdef DEBUG
    NSLog(@"NSManagedContext did save.");
#endif
}


@end
