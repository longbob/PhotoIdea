//
//  PICreationViewController.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/1/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "PICreationViewController.h"

#import "PIIdeaDAO.h"
#import "PIIdeaViewObject.h"

@interface PICreationViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem *done;
@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextField *details;

@end


@implementation PICreationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configureReactiveDoneEnabling];
}

- (void)configureReactiveDoneEnabling
{
    id(^textValidator)(NSString *) = ^id(NSString *text) {
        return @(text.length > 0);
    };
    
    RACSignal *titleValidSignal = [self.titleTextField.rac_textSignal map:textValidator];
    RACSignal *detailsValidSignal = [self.details.rac_textSignal      map:textValidator];
    
    [[RACSignal combineLatest:@[titleValidSignal,detailsValidSignal]
                       reduce:^id(NSNumber *titleValid, NSNumber *detailsValid)
                        {
                           return @(titleValid.boolValue && detailsValid.boolValue);
                        }]
                subscribeNext:^(NSNumber *enabled)
                        {
                            self.done.enabled = enabled.boolValue;
                        }];
}

#pragma mark - actions

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"doneAddingIdea"]) {
        [[PIIdeaDAO sharedDAO] addIdea:[PIIdeaViewObject ideaWithTitle:self.titleTextField.text
                                                                       details:self.details.text]];
    }
}

@end
