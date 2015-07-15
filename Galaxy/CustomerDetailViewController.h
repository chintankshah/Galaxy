//
//  CustomerDetailViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/9/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerViewController.h"
#import "CustomerProfileView.h"
#import "CustomerHistoryView.h"
#import "CustomerContactView.h"
#import "CustomerNewsView.h"
#import "LeadsHexButton.h"
#import "CustomersModel.h"

@interface CustomerDetailViewController : BaseViewController

@property (strong, nonatomic) CustomersModel *customer;
@property (assign, nonatomic) int currentView;

@property (strong, nonatomic) IBOutlet LeadsHexButton *profileButton;
@property (strong, nonatomic) IBOutlet LeadsHexButton *historyButton;
@property (strong, nonatomic) IBOutlet LeadsHexButton *contactsButton;
@property (strong, nonatomic) IBOutlet LeadsHexButton *newsButton;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UILabel *companyName;
@property (strong, nonatomic) IBOutlet UIView *containerView;


@property (strong, nonatomic) CustomerProfileView *profileView;
@property (strong, nonatomic) CustomerHistoryView *historyView;
@property (strong, nonatomic) CustomerContactView *contactsView;
@property (strong, nonatomic) CustomerNewsView *newsView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonContainerWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonContainerHeightConstraint;

- (IBAction)showProfileAction:(id)sender;
- (IBAction)showHistoryAction:(id)sender;
- (IBAction)showContactsAction:(id)sender;
- (IBAction)showNewsAction:(id)sender;

@end
