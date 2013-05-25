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

- (IBAction)cancel:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

@implementation PICreationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"doneAddingIdea"]) {
        [[PIIdeaManager sharedInstance] addIdea:[PIIdeaViewObject ideaWithName:self.titleTextField.text]];
    }
}

@end
