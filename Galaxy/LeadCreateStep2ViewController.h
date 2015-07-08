//
//  LeadCreateStep2ViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeadStatusArrayModel.h"
#import "IQDropDownTextField.h"
#import "MPGTextField.h"

@interface LeadCreateStep2ViewController : UIViewController<UITextFieldDelegate, MPGTextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeightConstraint;

@property (strong, nonatomic) NSMutableArray *leadStatus;
@property (strong, nonatomic) NSMutableArray *leadSource;
@property (strong, nonatomic) NSMutableArray *employeeNames;

@property (strong, nonatomic) IBOutlet UILabel *headingLabel;
@property (strong, nonatomic) IBOutlet UILabel *SubHeadingLabel;
@property (strong, nonatomic) IBOutlet UILabel *pageTitle;



@property (strong, nonatomic) IBOutlet UIButton *callButton;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UIButton *chatButton;
@property (strong, nonatomic) IBOutlet UIButton *meetingButton;


@property (strong, nonatomic) IBOutlet IQDropDownTextField *leadStatusField;
@property (strong, nonatomic) IBOutlet IQDropDownTextField *leadSourceField;

@property (strong, nonatomic) IBOutlet MPGTextField *assignToField;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *followUpButtonHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *followUpButtonWidthConstraint;

@property (strong, nonatomic) IBOutlet UILabel *step6Heading;
@property (strong, nonatomic) IBOutlet UILabel *step7Heading;
@property (strong, nonatomic) IBOutlet UILabel *step8Heading;


@property (strong, nonatomic) IBOutlet UILabel *step6Label;
@property (strong, nonatomic) IBOutlet UILabel *step7Label;
@property (strong, nonatomic) IBOutlet UILabel *step8Label;
@property (strong, nonatomic) IBOutlet UILabel *step9Label;

@property (strong, nonatomic) IBOutlet UILabel *followUpLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stepLabelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stepLabelWidthConstraint;

@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textFieldHeightConstraint;


@property (strong, nonatomic) UITextField *activeField;

- (IBAction)callAction:(id)sender;
- (IBAction)chatAction:(id)sender;
- (IBAction)emailAction:(id)sender;
- (IBAction)meetingAction:(id)sender;
- (IBAction)nextAction:(id)sender;

@end
