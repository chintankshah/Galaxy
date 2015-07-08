//
//  MyLeadsView.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeadsHexButton.h"
#import "MyLeadSummaryModel.h"

@protocol MyLeadsViewDelegate

-(void)myLeadsAction:(id)sender;

@end

@interface MyLeadsView : UIView

@property (strong, nonatomic) IBOutlet LeadsHexButton *pitchedButton;
@property (strong, nonatomic) IBOutlet LeadsHexButton *inProposalButton;
@property (strong, nonatomic) IBOutlet LeadsHexButton *targetButton;
@property (strong, nonatomic) IBOutlet LeadsHexButton *leadsButton;
@property (strong, nonatomic) IBOutlet LeadsHexButton *queuedButton;

@property (strong, nonatomic) IBOutlet UILabel* pitched;
@property (strong, nonatomic) IBOutlet UILabel* inProposal;
@property (strong, nonatomic) IBOutlet UILabel* target;
@property (strong, nonatomic) IBOutlet UILabel* myLeads;
@property (strong, nonatomic) IBOutlet UILabel* queued;

@property (strong, nonatomic) IBOutlet UILabel* pitchedLabel;
@property (strong, nonatomic) IBOutlet UILabel* inProposalLabel;
@property (strong, nonatomic) IBOutlet UILabel* targetLabel;
@property (strong, nonatomic) IBOutlet UILabel* myLeadsLabel;
@property (strong, nonatomic) IBOutlet UILabel* queuedLabel;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hexContainerHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hexContainerWidth;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hexHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hexWidth;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hexValueHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view1TopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view2TopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view3TopConstraint;

@property (strong, nonatomic) id<MyLeadsViewDelegate> delegate;

- (IBAction)myLeadsAction:(id)sender;

-(void)initWithLeadSummaryModel:(MyLeadSummaryModel*) myLeadSummaryModel;

@end
