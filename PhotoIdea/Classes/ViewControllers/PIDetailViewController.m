//
//  PIDetailViewController.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 29/05/2014.
//  Copyright (c) 2014 Longbob. All rights reserved.
//

#import "PIDetailViewController.h"

@interface PIDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation PIDetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.idea.title;
    self.textView.text = self.idea.details;
}

@end
