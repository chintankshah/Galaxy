//
//  TeamLeadsView.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTGraphHostingView.h"
#import "CPTTheme.h"
#import "CPTPieChart.h"
#import "TeamLeadSummaryModel.h"

@interface TeamLeadsView : UIView

@property (nonatomic, strong) CPTGraphHostingView *hostView;
@property (nonatomic, strong) CPTTheme *selectedTheme;
@property (nonatomic, strong) CPTPieChart *pieChart;

@property (strong, nonatomic) IBOutlet UIView *chartView;
@property (strong, nonatomic) IBOutlet UILabel *target;
@property (strong, nonatomic) IBOutlet UILabel *pitched;

@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UILabel *pitchedLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *labelHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *chartWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *chartHeightConstraint;


@property (assign, nonatomic) int pieRadius;

- (void)setDataSourceDelegate:(id<CPTPlotDataSource, UIActionSheetDelegate>)dataSourceDelegate;


-(void)initPlotWithTeamLeadSummary: (TeamLeadSummaryModel*) teamLeadSummary;
-(void)configureHost;
-(void)configureGraph;
-(void)configureChart;
-(void)configureLegend;

@end
