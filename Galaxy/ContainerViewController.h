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
@property (strong, nonatomic) IBOutlet UIButton *backButton;

@property (strong, nonatomic) BaseViewController *child;
@property (strong, nonatomic) UIView *childView;

@property (strong, nonatomic) id dataObject;

- (IBAction)goBack:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dataObject:(id) dataObject;

@end