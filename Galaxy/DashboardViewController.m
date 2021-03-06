//
//  DashboardViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/24/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "DashboardViewController.h"
#import "NotificationsView.h"
#import "NotesView.h"
#import "NotificationsTableViewCell.h"
#import "DataService.h"
#import "AppDelegate.h"
@interface DashboardViewController ()

@end

@implementation DashboardViewController

#define SECOND_CONTAINER_LEADING_SPACE 50
#define THIRD_CONTAINER_LEADING_SPACE 100
#define kLevelUpdatesPerSecond 18

@synthesize panGestureSecondContainer;
@synthesize panGestureThirdContainer;
@synthesize panGestureShowSecondContainer;
@synthesize panGestureShowThirdContainer;
@synthesize tapGestureShowFirstContainer;
@synthesize tapGestureShowSecondContainer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getUpcomingMeetingModel];
    
    [self initView];
    [self setUpGestures];
    [self initOpenEars];
    
    [self.showThirdContainer setHidden:YES];
    [self.showSecondContainer setHidden:YES];
    
    [self setUpNotificationsView];
    [self setUpNotesView];
    
}

-(void)initView{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        [self.wishLabel setFont:[UIFont systemFontOfSize:24.0]];
        
        
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.upcomingMeetingModel.meetingTime];
        UIFont *largeFont = [UIFont systemFontOfSize:24.0];
        UIFont *smallFont = [UIFont systemFontOfSize:14.0];
        
        [attributedText addAttribute:NSFontAttributeName value:largeFont range:NSMakeRange(0, self.upcomingMeetingModel.meetingTime.length-2)];
        [attributedText addAttribute:NSFontAttributeName value:smallFont range:NSMakeRange(self.upcomingMeetingModel.meetingTime.length-2, 2)];
        
        
        [self.meetingTime setAttributedText:attributedText];
        [self.notificationLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.meetingSubject setFont:[UIFont systemFontOfSize:12.0]];
        [self.voiceCommandLabel setFont:[UIFont systemFontOfSize:12.0]];
        
        self.mikeIconHeightConstraint.constant = 30;
        self.mikeIconWidthConstraint.constant = 30;
        self.wishLabelHeightConstraint.constant = 30;
        self.meetingTimeHeightConstraint.constant= 30;
        
    }else{
        
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.upcomingMeetingModel.meetingTime];
        UIFont *largeFont = [UIFont systemFontOfSize:36.0];
        UIFont *smallFont = [UIFont systemFontOfSize:20.0];
        
        [attributedText addAttribute:NSFontAttributeName value:largeFont range:NSMakeRange(0, self.upcomingMeetingModel.meetingTime.length-2)];
        [attributedText addAttribute:NSFontAttributeName value:smallFont range:NSMakeRange(self.upcomingMeetingModel.meetingTime.length-2, 2)];
        
        [self.meetingTime setAttributedText:attributedText];
    }
    
    [self.meetingSubject setText:self.upcomingMeetingModel.meetingSubject];
}

-(void)initOpenEars{
    
    [self.voiceCommandLabel setText:@"Tap to start listening"];
    
    self.fliteController = [[OEFliteController alloc] init];
    self.openEarsEventsObserver = [[OEEventsObserver alloc] init];
    self.openEarsEventsObserver.delegate = self;
    self.slt = [[Slt alloc] init];
    
    self.restartAttemptsDueToPermissionRequests = 0;
    self.startupFailedDueToLackOfPermissions = FALSE;
    
    [self.openEarsEventsObserver setDelegate:self];
    
    [[OEPocketsphinxController sharedInstance] setActive:TRUE error:nil];
    
    NSArray *firstLanguageArray = @[@"LEAD",
                                    @"CUSTOMER"];
    
    
    OELanguageModelGenerator *languageModelGenerator = [[OELanguageModelGenerator alloc] init];
    
    NSError *error = [languageModelGenerator generateLanguageModelFromArray:firstLanguageArray withFilesNamed:@"FirstOpenEarsDynamicLanguageModel" forAcousticModelAtPath:[OEAcousticModel pathToModel:@"AcousticModelEnglish"]];
    
    
    if(error) {
        NSLog(@"Dynamic language generator reported error %@", [error description]);
    } else {
        self.pathToFirstDynamicallyGeneratedLanguageModel = [languageModelGenerator pathToSuccessfullyGeneratedLanguageModelWithRequestedName:@"FirstOpenEarsDynamicLanguageModel"];
        self.pathToFirstDynamicallyGeneratedDictionary = [languageModelGenerator pathToSuccessfullyGeneratedDictionaryWithRequestedName:@"FirstOpenEarsDynamicLanguageModel"];
    }
    
    self.usingStartingLanguageModel = TRUE;
    
    [[OEPocketsphinxController sharedInstance] setActive:TRUE error:nil]; // Call this once before setting properties of the OEPocketsphinxController instance.
    
    if([OEPocketsphinxController sharedInstance].isListening) { // Stop if we are currently listening.
        error = [[OEPocketsphinxController sharedInstance] stopListening];
        if(error)NSLog(@"Error stopping listening in stopButtonAction: %@", error);
    }
    
}

-(void)setUpNotesView{
    NSArray *bundleObjects;
    NotesView *notesView;
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"NotesView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[NotesView class]]){
            notesView = (NotesView *)object;
            break;
        }
    }
    
    notesView.pageTitle.transform = CGAffineTransformMakeRotation(M_PI / -2);
    [self.firstContainer addSubview:notesView];
    
}

-(void)setUpNotificationsView{
    
    [self getNotificationArrayModel];
    
    NSArray *bundleObjects;
    NotificationsView *notificationsView;
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"NotificationsView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[NotificationsView class]]){
            notificationsView = (NotificationsView *)object;
            break;
        }
    }
    
    notificationsView.pageTitle.transform = CGAffineTransformMakeRotation(M_PI / -2);
    notificationsView.badge.layer.cornerRadius = notificationsView.badge.layer.bounds.size.width/2;
    notificationsView.badge.layer.masksToBounds = YES;
    [notificationsView.badge setText: [NSString stringWithFormat:@"%lu", (unsigned long)self.notificationsArrayModel.notifications.count]];
    
    notificationsView.notificationsTableView.dataSource = self;
    notificationsView.notificationsTableView.delegate = self;
    
    [notificationsView.notificationsTableView setBackgroundColor:[UIColor clearColor]];
     
    [notificationsView.notificationsTableView registerNib:[UINib nibWithNibName:@"NotificationsTableViewCell" bundle:nil] forCellReuseIdentifier:@"NotificationsTableViewCell"];
    
    
    
    [self.secondContainer addSubview:notificationsView];
    
    [notificationsView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.secondContainer addConstraint:[NSLayoutConstraint constraintWithItem:notificationsView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.secondContainer
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:0.0]];
    
    [self.secondContainer addConstraint:[NSLayoutConstraint constraintWithItem:notificationsView
                                                                     attribute:NSLayoutAttributeRight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.secondContainer
                                                                     attribute:NSLayoutAttributeRight
                                                                    multiplier:1.0
                                                                      constant:0.0]];
    
    [self.secondContainer addConstraint:[NSLayoutConstraint constraintWithItem:notificationsView
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.secondContainer
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1.0
                                                                      constant:0.0]];
    
    [self.secondContainer addConstraint:[NSLayoutConstraint constraintWithItem:notificationsView
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.secondContainer
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1.0
                                                                      constant:0.0]];
}



#pragma Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.notificationsArrayModel.notifications.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotificationsTableViewCell *cell = (NotificationsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"NotificationsTableViewCell"];
    
    if (!cell)
    {
        cell = [[NotificationsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NotificationsTableViewCell"];
    }
    
    NotificationModel *notification = (NotificationModel*) self.notificationsArrayModel.notifications[indexPath.row];
    [cell initWithNotificationsModel:notification];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected table row: %ld", (long)indexPath.row);
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    
}


#pragma Gestures


-(void)setUpGestures{
    
    panGestureSecondContainer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panhideSecondContainer:)];
    panGestureSecondContainer.delegate = self;
    [self.firstContainer addGestureRecognizer:panGestureSecondContainer];
    
    panGestureThirdContainer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panhideThirdContainer:)];
    panGestureThirdContainer.delegate = self;
    [self.secondContainer addGestureRecognizer:panGestureThirdContainer];
    
    
    panGestureShowThirdContainer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panShowThirdContainer:)];
    [self.showThirdContainer addGestureRecognizer:panGestureShowThirdContainer];

    panGestureShowSecondContainer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panShowSecondContainer:)];
    [self.showSecondContainer addGestureRecognizer:panGestureShowSecondContainer];
    
    
    tapGestureShowSecondContainer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapShowSecondContainer:)];
    [self.secondContainer addGestureRecognizer:tapGestureShowSecondContainer];

    tapGestureShowFirstContainer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapShowFirstContainer:)];
    [self.firstContainer addGestureRecognizer:tapGestureShowFirstContainer];
    

}
-(void)tapShowSecondContainer:(UITapGestureRecognizer*)gestureRecognizer{
    
    CGPoint touchPoint = [gestureRecognizer locationInView: self.secondContainer];
    
    if (touchPoint.x <= (THIRD_CONTAINER_LEADING_SPACE-SECOND_CONTAINER_LEADING_SPACE)) {
        
        //close third container completely
        
        if(self.thirdContainerLeadingSpace.constant != self.view.bounds.size.width){
            
            [UIView animateWithDuration:0.2 animations:^{
                [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
                [self.showThirdContainer setHidden:NO];
                [self.view layoutIfNeeded];
            }];
            
        }
        
    }
    
}


-(void)tapShowFirstContainer:(UITapGestureRecognizer*)gestureRecognizer{
    
    CGPoint touchPoint = [gestureRecognizer locationInView: self.firstContainer];
    
    if (touchPoint.x <= SECOND_CONTAINER_LEADING_SPACE) {
        
        //close second container completely
        
        [UIView animateWithDuration:0.2 animations:^{
            
            [[self secondContainerLeadingSpace] setConstant: self.view.bounds.size.width];
            [[self secondContainerTrailingSpace] setConstant: -(self.view.bounds.size.width-SECOND_CONTAINER_LEADING_SPACE)];
            
            [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
            
            [[self showSecondContainerTrailingSpace] setConstant:0];
            [self.showSecondContainer setHidden:NO];
            
            [[self showThirdContainerTrailingSpace] setConstant:0];
            [self.showThirdContainer setHidden:NO];
            
            [self.view layoutIfNeeded];
            
        }];
        
    }
    
}

-(void)panShowThirdContainer:(UIPanGestureRecognizer*)gestureRecognizer{

    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    
    if (translation.x < 0 && gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        //show second container if closed else show third container
        if(self.thirdContainerLeadingSpace.constant != THIRD_CONTAINER_LEADING_SPACE){
            
            if(self.thirdContainerLeadingSpace.constant > THIRD_CONTAINER_LEADING_SPACE){
                self.thirdContainerLeadingSpace.constant = self.view.bounds.size.width + translation.x;
                self.showThirdContainerTrailingSpace.constant = -translation.x;
            }
        }
        
        
        
    } else if (translation.x < 0
               && (gestureRecognizer.state == UIGestureRecognizerStateEnded
                   || gestureRecognizer.state == UIGestureRecognizerStateFailed
                   || gestureRecognizer.state == UIGestureRecognizerStateCancelled)) {
        
        if(self.thirdContainerLeadingSpace.constant > (self.view.bounds.size.width+THIRD_CONTAINER_LEADING_SPACE)/2){
            //close third container completely
            
            if(self.thirdContainerLeadingSpace.constant != self.view.bounds.size.width){
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
                    [[self showThirdContainerTrailingSpace] setConstant:0];
                    [self.showThirdContainer setHidden:NO];
                    [self.view layoutIfNeeded];
                    
                }];
                
            }
            
        }else{
            //open third container completely
            
            if(self.thirdContainerLeadingSpace.constant != THIRD_CONTAINER_LEADING_SPACE){
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    [[self thirdContainerLeadingSpace] setConstant: THIRD_CONTAINER_LEADING_SPACE];
                    [self.showThirdContainer setHidden:YES];
                    [[self showThirdContainerTrailingSpace] setConstant:0];
                    [self.view layoutIfNeeded];
                    
                }];
                
            }
            
        }
        
        
    }
    
    
}

-(void)panShowSecondContainer:(UIPanGestureRecognizer*)gestureRecognizer{
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    CGPoint velocity = [gestureRecognizer velocityInView:gestureRecognizer.view];
    
    NSLog(@"velocity: %f", velocity.x);
    if(velocity.x < -1500){
        
//        NSLog(@"Opening second container completely");
//        [[self secondContainerLeadingSpace] setConstant: SECOND_CONTAINER_LEADING_SPACE];
//        [[self secondContainerTrailingSpace] setConstant: 0];
//        
////        [self.view layoutIfNeeded];
//        
//        [[self showSecondContainerTrailingSpace] setConstant:0];
//        [self.showSecondContainer setHidden:YES];

    }

    if (translation.x < 0 && gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        //show second container if closed else show third container
        if(self.secondContainerLeadingSpace.constant != SECOND_CONTAINER_LEADING_SPACE){
            
            if(self.secondContainerLeadingSpace.constant > SECOND_CONTAINER_LEADING_SPACE){
                self.secondContainerLeadingSpace.constant = self.view.bounds.size.width + translation.x;
                self.secondContainerTrailingSpace.constant = -(self.view.bounds.size.width - SECOND_CONTAINER_LEADING_SPACE + translation.x);
                self.showSecondContainerTrailingSpace.constant = -translation.x;
            }
            
            
        }
        else if(self.thirdContainerLeadingSpace.constant != THIRD_CONTAINER_LEADING_SPACE){
            
            if(self.thirdContainerLeadingSpace.constant > THIRD_CONTAINER_LEADING_SPACE)
                self.thirdContainerLeadingSpace.constant = self.view.bounds.size.width + translation.x;
            
            
            
        }
        
        
        
    } else if (translation.x < 0
               && (gestureRecognizer.state == UIGestureRecognizerStateEnded
                   || gestureRecognizer.state == UIGestureRecognizerStateFailed
                   || gestureRecognizer.state == UIGestureRecognizerStateCancelled)) {
                   
        NSLog(@"UIGestureRecognizerStateEnded called");
        if(self.secondContainerLeadingSpace.constant > (self.view.bounds.size.width+SECOND_CONTAINER_LEADING_SPACE)/2){
            //close second container completely
            
            if(self.secondContainerLeadingSpace.constant != self.view.bounds.size.width){
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    [[self secondContainerLeadingSpace] setConstant: self.view.bounds.size.width];
                    [[self secondContainerTrailingSpace] setConstant: -(self.view.bounds.size.width-SECOND_CONTAINER_LEADING_SPACE)];
                    
                    [[self showSecondContainerTrailingSpace] setConstant:0];
                    [self.showSecondContainer setHidden:NO];
                    
                    [[self showThirdContainerTrailingSpace] setConstant:0];
                    [self.showThirdContainer setHidden:NO];
                    
                    [self.view layoutIfNeeded];
                    
                }];
                
            }
            
        }else{
            //open second container completely
            
            if(self.secondContainerLeadingSpace.constant != SECOND_CONTAINER_LEADING_SPACE){
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    [[self secondContainerLeadingSpace] setConstant: SECOND_CONTAINER_LEADING_SPACE];
                    [[self secondContainerTrailingSpace] setConstant: 0];
                    
                    [self.view layoutIfNeeded];
                    
                }];
                
            }
            
            [[self showSecondContainerTrailingSpace] setConstant:0];
            [self.showSecondContainer setHidden:YES];
            
        }
        
        if(self.thirdContainerLeadingSpace.constant > (self.view.bounds.size.width+THIRD_CONTAINER_LEADING_SPACE)/2){
            //close third container completely
            
            if(self.thirdContainerLeadingSpace.constant != self.view.bounds.size.width){
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
                    [self.showThirdContainer setHidden:NO];
                    [self.view layoutIfNeeded];
                    
                }];
                
            }
            
        }else{
            //open third container completely
            
            if(self.thirdContainerLeadingSpace.constant != THIRD_CONTAINER_LEADING_SPACE){
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    [[self thirdContainerLeadingSpace] setConstant: THIRD_CONTAINER_LEADING_SPACE];
                    [self.showThirdContainer setHidden:YES];
                    [self.view layoutIfNeeded];
                    
                }];
                
            }
            
        }
        
        
    }
    
    
}


-(void)panhideSecondContainer:(UIPanGestureRecognizer*)gestureRecognizer{

    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    CGPoint velocity = [gestureRecognizer velocityInView:gestureRecognizer.view];
    
    if(velocity.x > 1500){
        //close second container completely
//        NSLog(@"close second container completely");
        [[self secondContainerLeadingSpace] setConstant: self.view.bounds.size.width];
        [[self secondContainerTrailingSpace] setConstant: -(self.view.bounds.size.width-SECOND_CONTAINER_LEADING_SPACE)];
        
        [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
        
        [[self showSecondContainerTrailingSpace] setConstant:0];
        [self.showSecondContainer setHidden:NO];
        
        [[self showThirdContainerTrailingSpace] setConstant:0];
        [self.showThirdContainer setHidden:NO];

        
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
    } else if (translation.x > 0 && gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        //transition effect while closing second container
        
        if(self.secondContainerLeadingSpace.constant != self.view.bounds.size.width){
            self.secondContainerLeadingSpace.constant = SECOND_CONTAINER_LEADING_SPACE + translation.x;
            self.secondContainerTrailingSpace.constant = -translation.x;
        }
        
        if(self.thirdContainerLeadingSpace.constant != self.view.bounds.size.width)
            self.thirdContainerLeadingSpace.constant = THIRD_CONTAINER_LEADING_SPACE + translation.x;
        
        
    } else if (translation.x > 0
               && (gestureRecognizer.state == UIGestureRecognizerStateEnded
                   || gestureRecognizer.state == UIGestureRecognizerStateFailed
                   || gestureRecognizer.state == UIGestureRecognizerStateCancelled)) {
        
        if(self.secondContainerLeadingSpace.constant > (self.view.bounds.size.width+SECOND_CONTAINER_LEADING_SPACE)/2){
            //close second container completely
            
            [UIView animateWithDuration:0.2 animations:^{
                
                [[self secondContainerLeadingSpace] setConstant: self.view.bounds.size.width];
                [[self secondContainerTrailingSpace] setConstant: -(self.view.bounds.size.width-SECOND_CONTAINER_LEADING_SPACE)];
                
                [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
                
                [[self showSecondContainerTrailingSpace] setConstant:0];
                [self.showSecondContainer setHidden:NO];
                
                [[self showThirdContainerTrailingSpace] setConstant:0];
                [self.showThirdContainer setHidden:NO];

                [self.view layoutIfNeeded];
                
            }];
            
        }else{
            //open second container completely
            
            [UIView animateWithDuration:0.1 animations:^{
                
                [[self secondContainerLeadingSpace] setConstant: SECOND_CONTAINER_LEADING_SPACE];
                
                if(self.thirdContainerLeadingSpace.constant != self.view.bounds.size.width){
                    [[self thirdContainerLeadingSpace] setConstant: THIRD_CONTAINER_LEADING_SPACE];
                    
                    [[self showSecondContainerTrailingSpace] setConstant:0];
                    [self.showSecondContainer setHidden:YES];

                }
                [self.view layoutIfNeeded];
                
            }];
            
        }
        
    }
    
}

-(void)panhideThirdContainer:(UIPanGestureRecognizer*)gestureRecognizer{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    CGPoint velocity = [gestureRecognizer velocityInView:gestureRecognizer.view];

    if(velocity.x > 1500){
        
        //close third container completely
        [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
        [[self showThirdContainerTrailingSpace] setConstant:0];
        [self.showThirdContainer setHidden:NO];
        [self.view layoutIfNeeded];

        
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
    } else if (translation.x > 0 && gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        //transition effect while closing third container
        
        if(self.thirdContainerLeadingSpace.constant != self.view.bounds.size.width)
            self.thirdContainerLeadingSpace.constant = THIRD_CONTAINER_LEADING_SPACE + translation.x;
        
    } else if (translation.x > 0
               && (gestureRecognizer.state == UIGestureRecognizerStateEnded
                   || gestureRecognizer.state == UIGestureRecognizerStateFailed
                   || gestureRecognizer.state == UIGestureRecognizerStateCancelled)) {
        
        if(self.thirdContainerLeadingSpace.constant > (self.view.bounds.size.width+THIRD_CONTAINER_LEADING_SPACE)/2){
            //close third container completely
            
            
            [UIView animateWithDuration:0.2 animations:^{
                
                [[self thirdContainerLeadingSpace] setConstant: self.view.bounds.size.width];
                [[self showThirdContainerTrailingSpace] setConstant:0];
                [self.showThirdContainer setHidden:NO];
                [self.view layoutIfNeeded];
                
            }];
            
        }else{
            //open third container completely
            
            [UIView animateWithDuration:0.1 animations:^{
                [[self thirdContainerLeadingSpace] setConstant: THIRD_CONTAINER_LEADING_SPACE];
                [[self showThirdContainerTrailingSpace] setConstant:0];
                [self.showThirdContainer setHidden:YES];
                [self.view layoutIfNeeded];
                
            }];

        }
        
    }
    
    
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:
(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma Service

-(void) getNotificationArrayModel{
    DataService *service = [[DataService alloc] init];
    self.notificationsArrayModel = [service getNotificationsModel];
}

-(void) getUpcomingMeetingModel{
    DataService *service = [[DataService alloc] init];
    self.upcomingMeetingModel = [service getUpcomingMeetingModel];
}

- (IBAction)showSecondContainerAction:(id)sender {
    //open second container completely
    
    [UIView animateWithDuration:0.2 animations:^{
        [[self secondContainerLeadingSpace] setConstant: SECOND_CONTAINER_LEADING_SPACE];
        [[self showSecondContainerTrailingSpace] setConstant:0];
        [self.showSecondContainer setHidden:YES];
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)showThirdContainerAction:(id)sender {
    //open third container completely
    
    [UIView animateWithDuration:0.2 animations:^{
        [[self thirdContainerLeadingSpace] setConstant: THIRD_CONTAINER_LEADING_SPACE];
        [[self showThirdContainerTrailingSpace] setConstant:0];
        [self.showThirdContainer setHidden:YES];
        [self.view layoutIfNeeded];
        
    }];

}
- (IBAction)toggleVoiceCommand:(id)sender {
    
    if(![OEPocketsphinxController sharedInstance].isListening) {
        NSLog(@"listening voice commands");
        [[OEPocketsphinxController sharedInstance] startListeningWithLanguageModelAtPath:self.pathToFirstDynamicallyGeneratedLanguageModel dictionaryAtPath:self.pathToFirstDynamicallyGeneratedDictionary acousticModelAtPath:[OEAcousticModel pathToModel:@"AcousticModelEnglish"] languageModelIsJSGF:FALSE];
        
        [self.voiceCommandLabel setText:@"Listening..."];
    }else{
        NSLog(@"not listening voice commands");
        NSError *error = nil;
        error = [[OEPocketsphinxController sharedInstance] stopListening];
        if(error)NSLog(@"Error stopping listening in stopButtonAction: %@", error);
        
        [self.voiceCommandLabel setText:@"Tap to start listening"];
    }
    
}


-(void)loadController: (NSString *) controller{
    NSLog(@"redirecting to %@", controller);
    
    NSError *error = nil;
    error = [[OEPocketsphinxController sharedInstance] stopListening];
    if(error)
        NSLog(@"Error stopping listening in stopButtonAction: %@", error);
    else
        [self.voiceCommandLabel setText:@"Tap to start listening"];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.rootController loadContentViewWith:controller];
}

#pragma OEEventsObserverDelegate

// This is an optional delegate method of OEEventsObserver which delivers the text of speech that Pocketsphinx heard and analyzed, along with its accuracy score and utterance ID.
- (void) pocketsphinxDidReceiveHypothesis:(NSString *)hypothesis recognitionScore:(NSString *)recognitionScore utteranceID:(NSString *)utteranceID {
    
    NSLog(@"Local callback: The received hypothesis is %@ with a score of %@ and an ID of %@", hypothesis, recognitionScore, utteranceID);
    
    if ([hypothesis isEqualToString:@"LEAD"]) {
        
        [self loadController:@"LeadViewController"];
        
    }
    else if ([hypothesis isEqualToString:@"CUSTOMER"]) {
        
        [self loadController:@"CustomersViewController"];
        
    }
    
    // This is how to use an available instance of OEFliteController. We're going to repeat back the command that we heard with the voice we've chosen.
    [self.fliteController say:[NSString stringWithFormat:@"You said %@",hypothesis] withVoice:self.slt];
}


/** Pocketsphinx couldn't start because it has no mic permissions (will only be returned on iOS7 or later).*/
- (void) pocketsphinxFailedNoMicPermissions {
    NSLog(@"Local callback: The user has never set mic permissions or denied permission to this app's mic, so listening will not start.");
    self.startupFailedDueToLackOfPermissions = TRUE;
    if([OEPocketsphinxController sharedInstance].isListening){
        NSError *error = [[OEPocketsphinxController sharedInstance] stopListening]; // Stop listening if we are listening.
        if(error) NSLog(@"Error while stopping listening in micPermissionCheckCompleted: %@", error);
    }
}

/** The user prompt to get mic permissions, or a check of the mic permissions, has completed with a TRUE or a FALSE result  (will only be returned on iOS7 or later).*/
- (void) micPermissionCheckCompleted:(BOOL)result {
    if(result) {
        self.restartAttemptsDueToPermissionRequests++;
        if(self.restartAttemptsDueToPermissionRequests == 1 && self.startupFailedDueToLackOfPermissions) { // If we get here because there was an attempt to start which failed due to lack of permissions, and now permissions have been requested and they returned true, we restart exactly once with the new permissions.
            
            if(![OEPocketsphinxController sharedInstance].isListening) { // If there was no error and we aren't listening, start listening.
                [[OEPocketsphinxController sharedInstance]
                 startListeningWithLanguageModelAtPath:self.pathToFirstDynamicallyGeneratedLanguageModel
                 dictionaryAtPath:self.pathToFirstDynamicallyGeneratedDictionary
                 acousticModelAtPath:[OEAcousticModel pathToModel:@"AcousticModelEnglish"]
                 languageModelIsJSGF:FALSE]; // Start speech recognition.
                
                self.startupFailedDueToLackOfPermissions = FALSE;
            }
        }
    }
}

@end
