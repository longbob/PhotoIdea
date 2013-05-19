//
//  PIViewController.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PIViewController.h"

@interface PIViewController ()

@property (weak, nonatomic) IBOutlet UIButton *addIdea;

@end

@implementation PIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonSwiped:(id)sender {
    self.addIdea.hidden = true;
}

@end
