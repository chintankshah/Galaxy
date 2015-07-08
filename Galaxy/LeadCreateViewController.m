//
//  LeadCreateViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadCreateViewController.h"
#import "LeadCreateStep2ViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface LeadCreateViewController ()

@end

@implementation LeadCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self registerForKeyboardNotifications];
    
}

-(void)initView{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        self.textFieldHeightConstraint.constant = 40;
        self.stepLabelHeightConstraint.constant = 25;
        self.stepLabelWidthConstraint.constant = 25;
        
        [self.step1Label setFont:[UIFont systemFontOfSize:12]];
        [self.step2Label setFont:[UIFont systemFontOfSize:12]];
        [self.step3Label setFont:[UIFont systemFontOfSize:12]];
        [self.step4Label setFont:[UIFont systemFontOfSize:12]];
        [self.step5Label setFont:[UIFont systemFontOfSize:12]];
        
        [self.titleField setFont:[UIFont systemFontOfSize:12]];
        [self.companyNameField setFont:[UIFont systemFontOfSize:12]];
        [self.firstNameField setFont:[UIFont systemFontOfSize:12]];
        [self.lastNameField setFont:[UIFont systemFontOfSize:12]];
        [self.emailField setFont:[UIFont systemFontOfSize:12]];
        [self.contactNumberField setFont:[UIFont systemFontOfSize:12]];
        
        self.buttonHeightConstraint.constant = 40;
        self.buttonWidthConstraint.constant = 40;
        
    }
    
    self.pageTitle.transform = CGAffineTransformMakeRotation(M_PI / -2);
    self.nextButton.layer.cornerRadius = self.buttonHeightConstraint.constant/2;
    
    self.step1Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step1Label.layer.masksToBounds = YES;
    
    self.step2Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step2Label.layer.masksToBounds = YES;
    
    self.step3Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step3Label.layer.masksToBounds = YES;
    
    self.step4Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step4Label.layer.masksToBounds = YES;
    
    self.step5Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step5Label.layer.masksToBounds = YES;
    
    self.scrollHeightConstraint.constant = screenHeight;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
}


// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)nextAction:(id)sender {
    LeadCreateStep2ViewController *step2Controller = [[LeadCreateStep2ViewController alloc] init];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:step2Controller animated:YES];
    
}
@end
