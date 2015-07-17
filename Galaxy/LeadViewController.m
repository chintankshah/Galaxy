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

@synthesize selectedSegment;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self upDateSizeAndFonts];
    
    [self getMyLeadSummary];
    [self getTeamLeadSummary];
    [self setupSegmentedControl];
    
    selectedSegment = 0;
    [self loadMyLeadsView];
    
    
}

-(void)upDateSizeAndFonts{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
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
    
    ContainerViewController *leadListController = [[ContainerViewController alloc] initWithNibName:@"LeadListViewController" bundle:nil];
    
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
    selectedSegment = (int) sender.selectedSegmentIndex;
    
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
    
    if (self.leadView == nil) {
        NSArray *bundleObjects;
        
        bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"MyLeadsView" owner:self options:nil];
        for (id object in bundleObjects) {
            if ([object isKindOfClass:[MyLeadsView class]]){
                self.leadView = (MyLeadsView *)object;
                break;
            }
        }
        
        [self.leadView.quarterCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"QuarterViewCell"];
        
        self.leadView.delegate = self;
        [self.leadView initWithLeadSummaryModel:self.myLeadSummaryModel];
    
    }
    
    [self addViewToContentView:self.leadView];

}

-(void)loadTeamView{
    
    if (self.teamView == nil) {
        
        NSArray *bundleObjects;
        
        bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"TeamLeadsView" owner:self options:nil];
        for (id object in bundleObjects) {
            if ([object isKindOfClass:[TeamLeadsView class]]){
                self.teamView = (TeamLeadsView *)object;
                break;
            }
        }
        
        [self.teamView initPlotWithTeamLeadSummary:self.teamLeadSummaryModel];
        [self.teamView setDataSourceDelegate:self];
        
    }
    
    [self addViewToContentView:self.teamView];
    
}

-(void)loadCompanyView{
    [self loadTeamView];
}

#pragma CollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QuarterViewCell" forIndexPath:indexPath];
    
    NSArray *viewsToRemove = [cell subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    
    NSString *quarterString = [NSString stringWithFormat:@"QUARTER %ld", (long)indexPath.row+1];
    
    CGRect rect = CGRectMake(0, 0, 100, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:quarterString];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:220.0/255.0 green:189.0/255.0 blue:36.0/255.0 alpha:1] range:NSMakeRange(0, quarterString.length)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, quarterString.length)];
    
    [label setAttributedText:attributedString];
    
    [cell addSubview:label];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize cellsize = CGSizeMake(100, 30);
    return cellsize;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollToVisivbleCell];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate{
    
    if (!decelerate) {
        [self scrollToVisivbleCell];
    }
    
}

-(NSIndexPath*)getVisibleIndexForCollectionView: (UICollectionView*) collectionView{
    
    CGRect visibleRect = (CGRect){.origin = collectionView.contentOffset, .size = collectionView.bounds.size};
    
    CGPoint visiblePoint = CGPointMake(CGRectGetMidX(visibleRect), CGRectGetMidY(visibleRect));
    NSIndexPath *visibleIndexPath = [collectionView indexPathForItemAtPoint:visiblePoint];
    
    return visibleIndexPath;
}

-(UICollectionView*) getVisibleCollectionView{
    switch (self.selectedSegment) {
        case 0:
            return self.leadView.quarterCollectionView;
        default:
            return self.leadView.quarterCollectionView;
    }
}

-(void)scrollToVisivbleCell{
    
    UICollectionView *collectionView = [self getVisibleCollectionView];
    NSIndexPath *visibleIndexPath =  [self getVisibleIndexForCollectionView:collectionView];
    
    [collectionView scrollToItemAtIndexPath:visibleIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
}

-(void)showNext{
    
    UICollectionView *collectionView = [self getVisibleCollectionView];
    NSIndexPath *visibleIndexPath =  [self getVisibleIndexForCollectionView:collectionView];
    
    if (visibleIndexPath.row < 3) {
        
        NSInteger newLast = [visibleIndexPath indexAtPosition:visibleIndexPath.length-1]+1;
        visibleIndexPath = [[visibleIndexPath indexPathByRemovingLastIndex] indexPathByAddingIndex:newLast];
        
        [collectionView scrollToItemAtIndexPath:visibleIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }

}

-(void)showPrevious{
    
    UICollectionView *collectionView = [self getVisibleCollectionView];
    NSIndexPath *visibleIndexPath =  [self getVisibleIndexForCollectionView:collectionView];
    
    if (visibleIndexPath.row > 0) {
        
        NSInteger newLast = [visibleIndexPath indexAtPosition:visibleIndexPath.length-1]-1;
        visibleIndexPath = [[visibleIndexPath indexPathByRemovingLastIndex] indexPathByAddingIndex:newLast];
        
        [collectionView scrollToItemAtIndexPath:visibleIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    
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
