//
//  DashboardViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/24/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationsView.h"
#import "NotificationArrayModel.h"
#import "UpcomingMeetingModel.h"
#import "BaseViewController.h"

@interface DashboardViewController : UIViewController <UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *firstContainer;
@property (strong, nonatomic) IBOutlet UIView *secondContainer;
@property (strong, nonatomic) IBOutlet UIView *thirdContainer;

@property (strong, nonatomic) IBOutlet UIButton *showSecondContainer;
@property (strong, nonatomic) IBOutlet UIButton *showThirdContainer;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *secondContainerLeadingSpace;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *thirdContainerLeadingSpace;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *showSecondContainerTrailingSpace;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *showThirdContainerTrailingSpace;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *wishLabel;
@property (strong, nonatomic) IBOutlet UILabel *notificationLabel;
@property (strong, nonatomic) IBOutlet UILabel *meetingTime;
@property (strong, nonatomic) IBOutlet UILabel *meetingSubject;
@property (strong, nonatomic) IBOutlet UILabel *voiceCommandLabel;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *wishLabelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *meetingTimeHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mikeIconHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mikeIconWidthConstraint;

@property (strong, nonatomic) UIPanGestureRecognizer *panGestureSecondContainer;
@property (strong, nonatomic) UIPanGestureRecognizer *panGestureThirdContainer;

@property (strong, nonatomic) UIPanGestureRecognizer *panGestureShowSecondContainer;
@property (strong, nonatomic) UIPanGestureRecognizer *panGestureShowThirdContainer;

@property (strong, nonatomic) NotificationsView *notificationView;

@property (strong, nonatomic) NotificationArrayModel *notificationsArrayModel;
@property (strong, nonatomic) UpcomingMeetingModel *upcomingMeetingModel;


@end
