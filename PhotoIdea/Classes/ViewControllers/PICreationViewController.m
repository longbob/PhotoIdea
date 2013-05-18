//
//  PICreationViewController.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PICreationViewController.h"
#import "PIIdeaManager.h"
#import "PIIdea.h"

@interface PICreationViewController ()

- (IBAction)done:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

@implementation PICreationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (void)done:(UIBarButtonItem *)sender
{
    [[PIIdeaManager sharedInstance] addIdea:[PIIdea ideaWithName:self.titleTextField.text]];
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

@end
