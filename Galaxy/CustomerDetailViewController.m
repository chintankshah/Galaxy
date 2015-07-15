//
//  CustomerDetailViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/9/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "CustomerDetailViewController.h"

#define PROFILE_VIEW_INDEX 0
#define HISTORY_VIEW_INDEX 1
#define CONTACTS_VIEW_INDEX 2
#define NEWS_VIEW_INDEX 3

@interface CustomerDetailViewController ()

@end

@implementation CustomerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.dataObject != nil)
        self.customer = (CustomersModel *) self.dataObject;

    
    [self.contentView setAlpha:0.5];
    
    [self initViews];
    [self.containerView addSubview:self.profileView];
    [self addConstraints:self.profileView];
    self.currentView = PROFILE_VIEW_INDEX;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViews{
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        self.buttonHeightConstraint.constant = 80;
        self.buttonWidthConstraint.constant = 65;
        
        self.buttonContainerWidthConstraint.constant = 290;
        self.buttonContainerHeightConstraint.constant = 150;
        
        self.profileButton.imageEdgeInsets = UIEdgeInsetsMake(-5, -2, -5, -2);
        self.historyButton.imageEdgeInsets = UIEdgeInsetsMake(-5, -2, -5, -2);
        self.contactsButton.imageEdgeInsets = UIEdgeInsetsMake(-5, -2, -5, -2);
        self.newsButton.imageEdgeInsets = UIEdgeInsetsMake(-5, -2, -5, -2);
        
    }else{
        
    }
    
    [self.companyName setText: [self.customer.profile.name uppercaseString]];
    
    NSArray *bundleObjects;
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomerProfileView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[CustomerProfileView class]]){
            self.profileView = (CustomerProfileView *)object;
            break;
        }
    }
    
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomerHistoryView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[CustomerHistoryView class]]){
            self.historyView = (CustomerHistoryView*)object;
            break;
        }
    }
    
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomerContactView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[CustomerContactView class]]){
            self.contactsView = (CustomerContactView *)object;
            break;
        }
    }
    
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomerNewsView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[CustomerNewsView class]]){
            self.newsView = (CustomerNewsView *)object;
            break;
        }
    }
    
}


- (IBAction)showProfileAction:(id)sender {
    if (self.currentView != PROFILE_VIEW_INDEX) {
        [self showViewWith:PROFILE_VIEW_INDEX];
    }
}

- (IBAction)showHistoryAction:(id)sender {
    if (self.currentView != HISTORY_VIEW_INDEX) {
        [self showViewWith:HISTORY_VIEW_INDEX];
    }
}

- (IBAction)showContactsAction:(id)sender {
    if (self.currentView != CONTACTS_VIEW_INDEX) {
        [self showViewWith:CONTACTS_VIEW_INDEX];
    }
}

- (IBAction)showNewsAction:(id)sender {
    if (self.currentView != NEWS_VIEW_INDEX) {
        [self showViewWith:NEWS_VIEW_INDEX];
    }
}

-(void)showViewWith: (int) viewIndex{
    
    [UIView transitionWithView:self.containerView
                      duration:0.5
                       options:(self.currentView > viewIndex ? UIViewAnimationOptionTransitionFlipFromRight : UIViewAnimationOptionTransitionFlipFromLeft)
                    animations:^{
                        
                        switch (self.currentView) {
                            case 0:
                                [self.profileView removeFromSuperview];
                                break;
                            case 1:
                                [self.historyView removeFromSuperview];
                                break;
                            case 2:
                                [self.contactsView removeFromSuperview];
                                break;
                            case 3:
                                [self.newsView removeFromSuperview];
                                break;
                        }
                        
                        switch (viewIndex) {
                            case 0:
                                [self.containerView addSubview:self.profileView];
                                [self addConstraints:self.profileView];
                                break;
                            case 1:
                                [self.containerView addSubview:self.historyView];
                                [self addConstraints:self.historyView];
                                break;
                            case 2:
                                [self.containerView addSubview:self.contactsView];
                                [self addConstraints:self.contactsView];
                                break;
                            case 3:
                                [self.containerView addSubview:self.newsView];
                                [self addConstraints:self.newsView];
                                break;
                        }
                        
                    }
                    completion:^(BOOL finished){
                        self.currentView = viewIndex;
                    }
     ];

    
}

-(void)addConstraints:(UIView *)view{
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.containerView
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeRight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.containerView
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.containerView
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.containerView
                                                                   attribute:NSLayoutAttributeLeft
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    
}

@end
