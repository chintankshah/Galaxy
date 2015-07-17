//
//  BaseViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/25/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CalendarView.h"

@interface ContainerViewController : UIViewController<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIView *wrapperView;
@property (strong, nonatomic) IBOutlet UIView *sideView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *sideViewWidthConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentViewLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentViewTrailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuTrailingConstraint;

@property (strong, nonatomic) UIPanGestureRecognizer *globalPanGesture;

@property (strong, nonatomic) BaseViewController *child;
@property (strong, nonatomic) UIView *childView;

@property (strong, nonatomic) id dataObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dataObject:(id) dataObject;

@end