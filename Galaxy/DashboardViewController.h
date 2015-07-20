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
#import <OpenEars/OEEventsObserver.h>
#import <OpenEars/OEPocketsphinxController.h>
#import <OpenEars/OEFliteController.h>
#import <OpenEars/OELanguageModelGenerator.h>
#import <OpenEars/OELogging.h>
#import <OpenEars/OEAcousticModel.h>
#import <Slt/Slt.h>


@interface DashboardViewController : UIViewController <UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource, OEEventsObserverDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UIView *firstContainer;
@property (strong, nonatomic) IBOutlet UIView *secondContainer;
@property (strong, nonatomic) IBOutlet UIView *thirdContainer;

@property (strong, nonatomic) IBOutlet UIButton *showSecondContainer;
@property (strong, nonatomic) IBOutlet UIButton *showThirdContainer;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *secondContainerLeadingSpace;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *secondContainerTrailingSpace;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *thirdContainerLeadingSpace;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *thirdContainerTrailingSpace;


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

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureShowFirstContainer;
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureShowSecondContainer;

@property (strong, nonatomic) UIPanGestureRecognizer *panGestureShowSecondContainer;
@property (strong, nonatomic) UIPanGestureRecognizer *panGestureShowThirdContainer;

- (IBAction)showSecondContainerAction:(id)sender;
- (IBAction)showThirdContainerAction:(id)sender;

@property (strong, nonatomic) NotificationsView *notificationView;

@property (strong, nonatomic) NotificationArrayModel *notificationsArrayModel;
@property (strong, nonatomic) UpcomingMeetingModel *upcomingMeetingModel;
- (IBAction)toggleVoiceCommand:(id)sender;

// These three are the important OpenEars objects that this class demonstrates the use of.
@property (nonatomic, strong) Slt *slt;

@property (nonatomic, strong) OEEventsObserver *openEarsEventsObserver;
@property (nonatomic, strong) OEPocketsphinxController *pocketsphinxController;
@property (nonatomic, strong) OEFliteController *fliteController;

@property (nonatomic, assign) BOOL usingStartingLanguageModel;
@property (nonatomic, assign) int restartAttemptsDueToPermissionRequests;
@property (nonatomic, assign) BOOL startupFailedDueToLackOfPermissions;

@property (nonatomic, copy) NSString *pathToFirstDynamicallyGeneratedLanguageModel;
@property (nonatomic, copy) NSString *pathToFirstDynamicallyGeneratedDictionary;

@end
