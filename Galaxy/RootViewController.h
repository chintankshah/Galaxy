//
//  RootViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/24/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashboardViewController.h"

@interface RootViewController : UIViewController <UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *menuItems;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UITableView *menu;
@property (strong, nonatomic) BaseViewController *contentViewController;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentViewLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentViewTrailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuTrailingConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuWidthConstraint;

@property (strong, nonatomic) UIPanGestureRecognizer *globalPanGesture;
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;


-(IBAction)toggleMenu:(id)sender;
-(void)loadContentViewWith:(NSString *)nib;

@end
