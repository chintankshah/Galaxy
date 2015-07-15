//
//  LeadCreateStep3ViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "IQDropDownTextField.h"

@interface LeadCreateStep3ViewController : BaseViewController

@property (strong, nonatomic) UITextField *activeField;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeightConstraint;

@property (strong, nonatomic) IBOutlet UILabel *pageTitle;

@property (strong, nonatomic) IBOutlet UILabel *step10Heading;
@property (strong, nonatomic) IBOutlet UILabel *step11Heading;
@property (strong, nonatomic) IBOutlet UILabel *step12Heading;


@property (strong, nonatomic) IBOutlet UILabel *step10Label;
@property (strong, nonatomic) IBOutlet UILabel *step11Label;
@property (strong, nonatomic) IBOutlet UILabel *step12Label;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stepLabelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stepLabelWidthConstraint;


@property (strong, nonatomic) IBOutlet UIButton *recordingButton;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconWidthConstraint;

@property (strong, nonatomic) IBOutlet IQDropDownTextField *datePicker;
@property (strong, nonatomic) IBOutlet IQDropDownTextField *timePicker;

@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthConstraint;

- (IBAction)finishAction:(id)sender;

@end
