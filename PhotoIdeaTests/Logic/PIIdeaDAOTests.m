//
//  PIIdeaManagerTests.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
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

@interface PIIdeaDAOTests : SenTestCase

@property (nonatomic) PIIdeaDAO *dao;
@property (nonatomic) id documentMock;

@end

@implementation PIIdeaDAOTests

- (void)setUp
{
    self.dao = [PIIdeaDAO sharedDAO];
    self.documentMock =[OCMockObject mockForClass:[UIManagedDocument class]];
    
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
    
    [[[self.documentMock stub] andReturnValue:@NO] existsOnDisk];
    [[[self.documentMock stub] andReturn:url] fileURL];
    
    [[self.documentMock expect] saveToURL:url
                         forSaveOperation:UIDocumentSaveForCreating
                        completionHandler:OCMOCK_ANY];
    
    [self.dao performWithDocument:^(UIManagedDocument *document) {
    }];
    
    [self.documentMock verify];
}

- (void)testShould_open_document_when_closed
{

    [[[self.documentMock stub] andReturnValue:@YES] existsOnDisk];
    [[[self.documentMock stub] andReturnValue:@YES] isClosed];
    [[self.documentMock expect] openWithCompletionHandler:OCMOCK_ANY];
    
    [self.dao performWithDocument:^(UIManagedDocument *document) {
    }];
    
    [self.documentMock verify];
}

@end
