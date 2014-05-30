//
//  PIIdeaTableViewController.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 29/05/2014.
//  Copyright (c) 2014 Longbob. All rights reserved.
//

#import "PIIdeaTableViewController.h"

#import <ReactiveCocoa/RACEXTScope.h>

#import "PIIdeaDAO.h"
#import "PIIdea+CoreData.h"
#import "PIDetailViewController.h"

NSString *const kIdeaCacheName = @"ideaCache";

@interface PIIdeaTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) UIManagedDocument *document;
@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end


@implementation PIIdeaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    @weakify(self);
    [[PIIdeaDAO sharedDAO] performWithDocument:^(UIManagedDocument *document) {
        @strongify(self);
        self.document = document;
        NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:kIdeaEntityName];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:kTitleKey
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:document.managedObjectContext
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:kIdeaCacheName];
        self.fetchedResultsController.delegate = self;
        
        NSError *error = nil;
        if (![self.fetchedResultsController performFetch:&error] && error) {
            NSLog(@"Couldn't perform fetch. Error: %@",error);
        } else {
            self.tableView.hidden = false;
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self.document.managedObjectContext save:nil];
    self.fetchedResultsController = nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.fetchedResultsController sections][section] numberOfObjects];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.fetchedResultsController sections][section] name];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.fetchedResultsController sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *cellIdentifier = @"cellIdentifier";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}
#pragma mark helper methods

- (void) configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = ((PIIdea *)[self.fetchedResultsController objectAtIndexPath:indexPath]).title;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PIIdea *idea = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"viewDetails" sender:self];
    NSLog(@"title: %@", idea.title);
}

#pragma mark navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewDetails"]) {
        ((PIDetailViewController *)segue.destinationViewController).idea =
        [self.fetchedResultsController objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
    }
}

@end

@implementation PIIdeaTableViewController (NSFetchedResultsControllerDelegate)

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type
{
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath]
                    atIndexPath:indexPath];
            NSLog(@"HelloWorld");
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
@end
