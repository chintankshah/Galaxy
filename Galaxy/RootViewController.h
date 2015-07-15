//
//  RootViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/24/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerViewController.h"

@interface RootViewController : UIViewController <UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *menuItems;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UITableView *menu;
@property (strong, nonatomic) ContainerViewController *containerViewController;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuTrailingConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuWidthConstraint;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;


-(IBAction)toggleMenu:(id)sender;
-(void)loadContentViewWith:(NSString *)nib;

@end
