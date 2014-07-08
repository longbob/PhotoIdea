//
//  PIIdeaManagerTests.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

@import XCTest;
#import <OCMock/OCMock.h>

#import "PIIdeaDAO.h"
#import "PIIdeaViewObject.h"

@interface PIIdeaDAO()

@property (nonatomic) UIManagedDocument *document;

@end

@interface UIManagedDocument (PIIdeaDAOTests)

- (BOOL)existsOnDisk;
- (BOOL)isClosed;

@end

@interface PIIdeaDAOTests : XCTestCase

@property (nonatomic) PIIdeaDAO *dao;
@property (nonatomic) id documentMock;

@end

@implementation PIIdeaDAOTests

- (void)setUp
{
    self.dao = [PIIdeaDAO sharedDAO];
    
    self.documentMock = OCMClassMock([UIManagedDocument class]);
    self.dao.document = self.documentMock;
}

- (void)tearDown
{
    self.dao = nil;
    self.documentMock = nil;
}

- (void)testShould_create_document_when_not_existing
{
    NSURL *url = [NSURL URLWithString:@"url.com"];
    
    OCMStub([self.documentMock existsOnDisk]).andReturn(NO);
    OCMStub([self.documentMock fileURL]).andReturn(url);
    
    [self.dao performWithDocument:^(UIManagedDocument *document) {
    }];
    
    OCMVerify([self.documentMock saveToURL:url
                          forSaveOperation:UIDocumentSaveForCreating
                         completionHandler:OCMOCK_ANY]);

}

- (void)testShould_open_document_when_closed
{
    OCMStub([self.documentMock existsOnDisk]).andReturn(YES);
    OCMStub([self.documentMock isClosed]).andReturn(YES);
    
    
    [self.dao performWithDocument:^(UIManagedDocument *document) {
    }];
    
    OCMVerify([self.documentMock openWithCompletionHandler:OCMOCK_ANY]);
}

@end
