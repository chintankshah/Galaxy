//
//  LeadViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/28/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadViewController.h"
#import "LeadListViewController.h"
#import "AppDelegate.h"
#import "MyLeadsView.h"
#import "TeamLeadsView.h"
#import "CPTTextLayer.h"
#import "CPTColor.h"
#import "CPTMutableTextStyle.h"
#import "CPTFill.h"
#import "CPTBarPlot.h"
#import "DataService.h"
#import "MyLeadSummaryModel.h"
#import "TeamLeadSummaryModel.h"

@interface LeadViewController ()

@end

@implementation LeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self upDateSizeAndFonts];
    
    [self getMyLeadSummary];
    [self getTeamLeadSummary];
    [self setupSegmentedControl];
    [self loadMyLeadsView];
    
    
}

-(void)upDateSizeAndFonts{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    NSLog(@"screenHeight: %f screenWidth: %f", screenHeight, screenWidth);
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        [self.userName setFont:[UIFont systemFontOfSize:15.0]];
        [self.titleLabel setFont: [UIFont systemFontOfSize:18.0]];
        self.titleLabelHeightConstraint.constant = 25.0;
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupSegmentedControl{
    
    [self.leadsSegmentedControl setWidth:120 forSegmentAtIndex:0];
    [self.leadsSegmentedControl setWidth:120 forSegmentAtIndex:1];
    [self.leadsSegmentedControl setWidth:120 forSegmentAtIndex:2];
    
}

#pragma mark - CPTPlotDataSource methods

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
   return (self.teamLeadSummaryModel.team.count+1);
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    if ( index >= self.teamLeadSummaryModel.team.count+1 ) {
        return nil;
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    if(index == self.teamLeadSummaryModel.team.count){
        
        return [formatter numberFromString:self.teamLeadSummaryModel.remaining];
        
    }else if ( fieldEnum == CPTPieChartFieldSliceWidth ) {
        
        TeamLeadModel *teamMember = self.teamLeadSummaryModel.team[index];
        return [formatter numberFromString:teamMember.pitched];
        
    }
    else {
        return @(index);
    }
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index {
    
    CPTTextLayer *label;
    
    if(index == self.teamLeadSummaryModel.team.count){
        label = [[CPTTextLayer alloc] initWithText:[NSString stringWithFormat:@"%@ %@\nRemaining", self.teamLeadSummaryModel.currency, self.teamLeadSummaryModel.remaining]];
        
    }else{
        TeamLeadModel *teamMember = self.teamLeadSummaryModel.team[index];
        label = [[CPTTextLayer alloc] initWithText:[NSString stringWithFormat:@"%@ %@\n%@", self.teamLeadSummaryModel.currency, teamMember.pitched, teamMember.name]];
    }
    
    CPTMutableTextStyle *textStyle = [label.textStyle mutableCopy];
    textStyle.color = [CPTColor whiteColor];
    label.textStyle = textStyle;
    
    return label;
}

//-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index {
//    NSLog(@"returning legend title for %lu", (unsigned long)index);
//    return [NSString stringWithFormat:@"Pie Slice %lu", (unsigned long)];
//}

-(CPTFill *)sliceFillForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index
{
    CPTColor *areaColor = nil;
    switch (index)
    {
        case 0:
            areaColor = [CPTColor colorWithComponentRed:26.0/255.0 green:123.0/255.0 blue:210.0/255.0 alpha:1.0];
            break;
            
        case 1:
            areaColor = [CPTColor colorWithComponentRed:29.0/255.0 green:149.0/255.0 blue:50.0/255.0 alpha:1.0];
            break;
            
        case 2:
            areaColor = [CPTColor colorWithComponentRed:203.0/255.0 green:173.0/255.0 blue:31.0/255.0 alpha:1.0];
            break;
            
        case 3:
            areaColor = [CPTColor colorWithComponentRed:237.0/255.0 green:144.0/255.0 blue:23.0/255.0 alpha:1.0];
            break;
            
        case 4:
            areaColor = [CPTColor colorWithComponentRed:160.0/255.0 green:92.0/255.0 blue:203.0/255.0 alpha:1.0];
            break;
            
        case 5:
            areaColor = [CPTColor colorWithComponentRed:230.0/255.0 green:58.0/255.0 blue:10.0/255.0 alpha:1.0];
            break;
            
        default:
            areaColor = [CPTColor colorWithComponentRed:160.0/255.0 green:92.0/255.0 blue:203.0/255.0 alpha:1.0];
            break;
    }
    
    CPTFill *barFill = [CPTFill fillWithColor:areaColor];
    
    return barFill;
}

#pragma mark - UIActionSheetDelegate methods

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
}


#pragma MyLeadsViewDelegate

- (void)myLeadsAction:(id)sender {
    
    NSLog(@"myLeadsAction delegate method called");
    
    LeadListViewController *leadListController = [[LeadListViewController alloc] init];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:leadListController animated:YES];

}

#pragma IBActions

- (IBAction)toggleFilters:(id)sender {
    
    [self.view setNeedsUpdateConstraints];
    
    if(self.filtersLeadingSpaceContraint.constant == 0){
        [self.filtersLeadingSpaceContraint setConstant:-50.0];
    }else{
        [self.filtersLeadingSpaceContraint setConstant:0.0];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)leadsSegmentedControlAction:(UISegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    switch (selectedSegment) {
        case 0:
            [self loadMyLeadsView];
            break;
        case 1:
            [self loadTeamView];
            break;
        case 2:
            [self loadCompanyView];
            break;
    }
    
}

#pragma Managing Switching of Views

-(void)loadMyLeadsView{
    
    NSArray *bundleObjects;
    MyLeadsView *leadView;
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"MyLeadsView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[MyLeadsView class]]){
            leadView = (MyLeadsView *)object;
            break;
        }
    }
    
    leadView.delegate = self;
    [leadView initWithLeadSummaryModel:self.myLeadSummaryModel];
    
    [self addViewToContentView:leadView];
    
}

-(void)loadTeamView{
    
    NSArray *bundleObjects;
    TeamLeadsView *teamView;
    bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"TeamLeadsView" owner:self options:nil];
    for (id object in bundleObjects) {
        if ([object isKindOfClass:[TeamLeadsView class]]){
            teamView = (TeamLeadsView *)object;
            break;
        }
    }
    
    [teamView initPlotWithTeamLeadSummary:self.teamLeadSummaryModel];
    [teamView setDataSourceDelegate:self];
    
    [self addViewToContentView:teamView];
}

-(void)loadCompanyView{
    //TODO to be change
    [self loadTeamView];
}

-(void)addViewToContentView: (UIView*)view{
    
    //remove already existing sub view if exist
    NSArray *viewsToRemove = [self.contentView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    
    [self.contentView addSubview:view];
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:0.0]];
}

-(void)getMyLeadSummary{
    DataService *service = [[DataService alloc] init];
    self.myLeadSummaryModel = [service getMyLeadSummaryModel];
}

-(void)getTeamLeadSummary{
    DataService *service = [[DataService alloc] init];
    self.teamLeadSummaryModel = [service getTeamLeadSummaryModel];
}

@end
