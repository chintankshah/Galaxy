//
//  LeadCreateViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeadCreateViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollHeightConstraint;

@property (strong, nonatomic) IBOutlet UILabel *headingLabel;
@property (strong, nonatomic) IBOutlet UILabel *subHeadingLabel;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *headerHeightConstraint;

@property (strong, nonatomic) IBOutlet UILabel *pageTitle;

@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *companyNameField;
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *contactNumberField;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textFieldHeightConstraint;


@property (strong, nonatomic) IBOutlet UILabel *step1Label;
@property (strong, nonatomic) IBOutlet UILabel *step2Label;
@property (strong, nonatomic) IBOutlet UILabel *step3Label;
@property (strong, nonatomic) IBOutlet UILabel *step4Label;
@property (strong, nonatomic) IBOutlet UILabel *step5Label;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stepLabelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stepLabelWidthConstraint;

@property (strong, nonatomic) UITextField *activeField;

@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthConstraint;

- (IBAction)nextAction:(id)sender;

@end
