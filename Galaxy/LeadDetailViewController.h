//
//  LeadDetailViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/27/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LeadModel.h"

@interface LeadDetailViewController : BaseViewController <UIGestureRecognizerDelegate,UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIButton *preferedContactType;
@property (strong, nonatomic) IBOutlet UIButton *status;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *company;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UIView *notesView;
@property (strong, nonatomic) IBOutlet UIButton *toggleNotesView;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *notesButton;
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet UISwitch *sendEmailSwitch;

@property (strong, nonatomic) IBOutlet UILabel *addRecordingLabel;
@property (strong, nonatomic) IBOutlet UILabel *addNotesLabel;
@property (strong, nonatomic) IBOutlet UILabel *sendEmailLabel;
@property (strong, nonatomic) IBOutlet UILabel *addNotesTitle;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *notesViewHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageWidthConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *labelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageContainerHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *addNotesTitleHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconHeightConstraint;


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraint;

- (IBAction)moreMenuAction:(id)sender;
- (IBAction)toggleNotesViewAction:(id)sender;

@property (strong, nonatomic) LeadModel *lead;

@end
