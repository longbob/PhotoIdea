//
//  PICreationViewController.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PICreationViewController.h"
#import "PIIdeaManager.h"
#import "PIIdeaViewObject.h"

@interface PICreationViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem *done;
@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextField *details;

@end


@implementation PICreationViewController

#pragma mark - actions

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"doneAddingIdea"]) {
        PIIdeaViewObject *idea = [PIIdeaViewObject ideaWithTitle:self.titleTextField.text];
        if (![self.details.text isEqualToString:@""]) {
            idea.details = self.details.text;
        }
        [[PIIdeaManager sharedManager] addIdea:idea];
        
    }
}

@end
