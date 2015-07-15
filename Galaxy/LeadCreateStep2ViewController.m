//
//  LeadCreateStep2ViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadCreateStep2ViewController.h"
#import "DataService.h"
#import "LeadCreateStep3ViewController.h"
#import "AppDelegate.h"

@interface LeadCreateStep2ViewController ()

@end

@implementation LeadCreateStep2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getLeadStatusArrayModel];
    [self getLeadSourceArrayModel];
    [self getEmployeeListModel];
    
    [self initView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self registerForKeyboardNotifications];
    
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

-(void) initView{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        self.stepLabelHeightConstraint.constant = 25;
        self.stepLabelWidthConstraint.constant = 25;
        
        [self.step6Label setFont:[UIFont systemFontOfSize:12]];
        [self.step7Label setFont:[UIFont systemFontOfSize:12]];
        [self.step8Label setFont:[UIFont systemFontOfSize:12]];
        [self.step9Label setFont:[UIFont systemFontOfSize:12]];
        
        [self.step7Heading setFont:[UIFont systemFontOfSize:12]];
        [self.step8Heading setFont:[UIFont systemFontOfSize:12]];
        [self.step6Heading setFont:[UIFont systemFontOfSize:12]];

        self.textFieldHeightConstraint.constant = 40;
        self.followUpButtonHeightConstraint.constant = 40;
        self.followUpButtonWidthConstraint.constant = 40;
        
        
        [self.leadSourceField setFont:[UIFont systemFontOfSize:12]];
        [self.leadStatusField setFont:[UIFont systemFontOfSize:12]];
        [self.assignToField setFont:[UIFont systemFontOfSize:12]];
        
        self.buttonHeightConstraint.constant = 40;
        self.buttonWidthConstraint.constant = 40;
        
    }
    
    
    self.step6Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step6Label.layer.masksToBounds = YES;
    
    self.step7Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step7Label.layer.masksToBounds = YES;
    
    self.step8Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step8Label.layer.masksToBounds = YES;
    
    self.step9Label.layer.cornerRadius = self.stepLabelHeightConstraint.constant/2;
    self.step9Label.layer.masksToBounds = YES;
    
    self.pageTitle.transform = CGAffineTransformMakeRotation(M_PI / -2);
    self.nextButton.layer.cornerRadius = self.buttonHeightConstraint.constant/2;
    
    self.callButton.layer.cornerRadius = self.followUpButtonHeightConstraint.constant/2;
    self.emailButton.layer.cornerRadius = self.followUpButtonHeightConstraint.constant/2;
    self.chatButton.layer.cornerRadius = self.followUpButtonHeightConstraint.constant/2;
    self.meetingButton.layer.cornerRadius = self.followUpButtonHeightConstraint.constant/2;
    
    UIColor *clearColor = [UIColor clearColor];
    UIColor *whiteColor = [UIColor whiteColor];
    
    self.callButton.layer.borderColor = whiteColor.CGColor;
    self.emailButton.layer.borderColor = whiteColor.CGColor;
    self.chatButton.layer.borderColor = whiteColor.CGColor;
    self.meetingButton.layer.borderColor = whiteColor.CGColor;
    
    self.callButton.layer.borderWidth = 1;
    self.emailButton.layer.borderWidth = 1;
    self.chatButton.layer.borderWidth = 1;
    self.meetingButton.layer.borderWidth = 1;
    
    [self.callButton setBackgroundColor:clearColor];
    [self.emailButton setBackgroundColor:clearColor];
    [self.chatButton setBackgroundColor:clearColor];
    [self.meetingButton setBackgroundColor:clearColor];
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlack];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
    
    
    self.leadStatusField.inputAccessoryView = toolbar;
    [self.leadStatusField setItemList: self.leadStatus];
    
    self.leadSourceField.inputAccessoryView = toolbar;
    [self.leadSourceField setItemList: self.leadSource];
    
    self.assignToField.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.assignToField.layer.borderWidth = 0.5;
    [self.assignToField setDelegate:self];
    
    self.scrollViewHeightConstraint.constant = screenHeight;
}

-(void)doneClicked:(UIBarButtonItem*)button
{
    [self.view endEditing:YES];
}



#pragma mark MPGTextField Delegate Methods

- (NSArray *)dataForPopoverInTextField:(MPGTextField *)textField
{
    if ([textField isEqual:self.assignToField]) {
        return self.employeeNames;
    }
    else{
        return nil;
    }
}

- (BOOL)textFieldShouldSelect:(MPGTextField *)textField
{
    return YES;
}

- (void)textField:(MPGTextField *)textField didEndEditingWithSelection:(NSDictionary *)result
{
    NSLog(@"didEndEditingWithSelection called");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)callAction:(id)sender {
    
    if (self.callButton.backgroundColor == [UIColor clearColor]) {
        [self.callButton setBackgroundColor:[UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:1.0/255.0 alpha:1]];
    }else{
        [self.callButton setBackgroundColor:[UIColor clearColor]];
    }
    
}
- (IBAction)chatAction:(id)sender {
    if (self.chatButton.backgroundColor == [UIColor clearColor]) {
        [self.chatButton setBackgroundColor:[UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:1.0/255.0 alpha:1]];
    }else{
        [self.chatButton setBackgroundColor:[UIColor clearColor]];
    }
}

- (IBAction)emailAction:(id)sender {
    if (self.emailButton.backgroundColor == [UIColor clearColor]) {
        [self.emailButton setBackgroundColor:[UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:1.0/255.0 alpha:1]];
    }else{
        [self.emailButton setBackgroundColor:[UIColor clearColor]];
    }
}

- (IBAction)meetingAction:(id)sender {
    if (self.meetingButton.backgroundColor == [UIColor clearColor]) {
        [self.meetingButton setBackgroundColor:[UIColor colorWithRed:253.0/255.0 green:140.0/255.0 blue:1.0/255.0 alpha:1]];
    }else{
        [self.meetingButton setBackgroundColor:[UIColor clearColor]];
    }
}

- (IBAction)nextAction:(id)sender {
    [self.view endEditing:YES];
    
    ContainerViewController *step3Controller = [[ContainerViewController alloc] initWithNibName:@"LeadCreateStep3ViewController" bundle:nil];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:step3Controller animated:YES];
}

-(void)getLeadStatusArrayModel{
    DataService *service = [[DataService alloc] init];
    LeadStatusArrayModel *leadStatusModel = [service getLeadStatusArrayModel];
    
    self.leadStatus = [[NSMutableArray alloc] init];
     
    for (int i=0; i<leadStatusModel.list.count; i++) {
        LeadStatusModel *leadStatus = leadStatusModel.list[i];
        [self.leadStatus addObject: leadStatus.statusName];
    }
    
}

-(void)getLeadSourceArrayModel{
    DataService *service = [[DataService alloc] init];
    LeadSourceArrayModel *leadSourceModel = [service getLeadSourceArrayModel];
    
    self.leadSource = [[NSMutableArray alloc] init];
    
    for (int i=0; i<leadSourceModel.list.count; i++) {
        LeadSourceModel *leadSource = leadSourceModel.list[i];
        [self.leadSource addObject: leadSource.sourceName];
    }
}

-(void)getEmployeeListModel{
    DataService *service = [[DataService alloc] init];
    EmployeeListModel *employeeList = [service getEmployeeListModel];
    
    self.employeeNames = [[NSMutableArray alloc] init];
    
    for (int i=0; i<employeeList.list.count; i++) {
        EmployeeModel *employee = employeeList.list[i];
        [self.employeeNames addObject:[NSDictionary dictionaryWithObjectsAndKeys:[employee.firstName stringByAppendingString:[NSString stringWithFormat:@" %@", employee.lastName]], @"DisplayText", nil]];
        
    }
}

@end
