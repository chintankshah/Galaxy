//
//  LeadCreateStep3ViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadCreateStep3ViewController.h"
#import "LeadViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"

@interface LeadCreateStep3ViewController ()

@end

@implementation LeadCreateStep3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self registerForKeyboardNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)initView{
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        self.stepLabelHeightConstraint.constant = 25;
        self.stepLabelWidthConstraint.constant = 25;
        
        [self.step10Label setFont:[UIFont systemFontOfSize:12]];
        [self.step11Label setFont:[UIFont systemFontOfSize:12]];
        [self.step12Label setFont:[UIFont systemFontOfSize:12]];
        
        [self.step10Heading setFont:[UIFont systemFontOfSize:12]];
        [self.step11Heading setFont:[UIFont systemFontOfSize:12]];
        [self.step12Heading setFont:[UIFont systemFontOfSize:12]];
        
        self.iconHeightConstraint.constant = 40;
        self.iconWidthConstraint.constant = 40;
        
        self.buttonHeightConstraint.constant = 40;
        self.buttonWidthConstraint.constant = 40;
        
    }
    
    self.step10Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step10Label.layer.masksToBounds = YES;
    
    self.step11Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step11Label.layer.masksToBounds = YES;
    
    self.step12Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step12Label.layer.masksToBounds = YES;
    
    self.recordingButton.layer.cornerRadius = self.iconHeightConstraint.constant/2;
    self.recordingButton.layer.borderWidth = 1;
    self.recordingButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    self.nextButton.layer.cornerRadius = self.buttonHeightConstraint.constant/2;
    
    self.pageTitle.transform = CGAffineTransformMakeRotation(M_PI / -2);
    self.scrollViewHeightConstraint.constant = screenHeight;
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
    self.datePicker.inputAccessoryView = toolbar;
    self.timePicker.inputAccessoryView = toolbar;
    
    UIColor *clearColor = [UIColor clearColor];
    [self.datePicker setBackgroundColor: clearColor];
    [self.timePicker setBackgroundColor: clearColor];
    
    self.datePicker.layer.borderWidth = 0;
    self.timePicker.layer.borderWidth = 0;
    
    UIColor *whiteColor = [UIColor whiteColor];
    
    self.datePicker.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.datePicker.placeholder attributes:@{NSForegroundColorAttributeName: whiteColor}];
    
    self.timePicker.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.timePicker.placeholder attributes:@{NSForegroundColorAttributeName: whiteColor}];
    
    [self.datePicker setDropDownMode:IQDropDownModeDatePicker];
    [self.timePicker setDropDownMode:IQDropDownModeTimePicker];
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

-(void)doneClicked:(UIBarButtonItem*)button
{
    [self.view endEditing:YES];
}

- (IBAction)finishAction:(id)sender {
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    UIWindow *window = [[UIWindow alloc] initWithFrame:screenBounds];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.rootController loadContentViewWith:@"LeadViewController"];
    appDelegate.navigationController = [[UINavigationController alloc] initWithRootViewController:appDelegate.rootController];
    appDelegate.navigationController.navigationBarHidden = YES;
    
    [window setRootViewController: appDelegate.navigationController];
    [window makeKeyAndVisible];
    [self setWindow:window];
    
}
@end
