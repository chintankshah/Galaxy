//
//  LeadViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/28/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeadsHexButton.h"
#import "MyLeadsView.h"
#import "CPTPieChart.h"
#import "TeamLeadSummaryModel.h"
#import "MyLeadSummaryModel.h"
#import "CustomSegmentedControl.h"
#import "BaseViewController.h"

@interface LeadViewController : BaseViewController<UIGestureRecognizerDelegate, MyLeadsViewDelegate, CPTPlotDataSource, UIActionSheetDelegate, CPTPieChartDelegate>

@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet CustomSegmentedControl *leadsSegmentedControl;
@property (strong, nonatomic) IBOutlet UIButton *filterButton;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *filtersLeadingSpaceContraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleLabelHeightConstraint;

@property (strong, nonatomic) TeamLeadSummaryModel *teamLeadSummaryModel;
@property (strong, nonatomic) MyLeadSummaryModel *myLeadSummaryModel;

- (IBAction)toggleFilters:(id)sender;
- (IBAction)leadsSegmentedControlAction:(UISegmentedControl *)sender;



@end
