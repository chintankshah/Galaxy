//
//  TeamLeadsView.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "TeamLeadsView.h"
#import "CPTGraph.h"
#import "CPTGradient.h"
#import "CPTColor.h"
#import "CPTFill.h"
#import "CPTXYGraph.h"
#import "CPTMutableTextStyle.h"
#import "CPTLegend.h"
#import "CPTLineStyle.h"
#import "CPTMutableTextStyle.h"

@implementation TeamLeadsView

#define DegreesToRadians(angle) ((angle * M_PI) / 180.0 )

- (void)initView{
    // Drawing code
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        self.chartHeightConstraint.constant = 220;
        self.chartWidthConstraint.constant = 220;
        self.pieRadius = 100;
        
        [self.targetLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.pitchedLabel setFont:[UIFont systemFontOfSize:12.0]];
        
        [self.target setFont:[UIFont systemFontOfSize:12.0]];
        [self.pitched setFont:[UIFont systemFontOfSize:12.0]];
        
        self.labelHeightConstraint.constant = 15;
        
    }else{
        self.pieRadius = 130;
    }
    
    
    
}

#pragma mark - Chart behavior

-(void)initPlotWithTeamLeadSummary: (TeamLeadSummaryModel*) teamLeadSummary{
    
    
    [self.target setText:[NSString stringWithFormat:@"%@ %@ Lakhs", teamLeadSummary.currency, teamLeadSummary.target]];
    [self.pitched setText:[NSString stringWithFormat:@"%@ %@ Lakhs", teamLeadSummary.currency, teamLeadSummary.pitched]];
    
    [self initView];
    [self configureHost];
    [self configureGraph];
    [self configureChart];
//    [self configureLegend];
    
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(DegreesToRadians(-180));
    [self.chartView setTransform: transform];
    
    [UIView animateWithDuration:1.0f animations:^{
        
        [self.chartView setTransform: CGAffineTransformIdentity];
        
    }];

}


-(void)configureHost{
    
    // 1 - Set up view frame
    CGRect parentRect = CGRectMake(0, 0, self.chartWidthConstraint.constant, self.chartHeightConstraint.constant);
    
    // 2 - Create host view
    self.hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:parentRect];
    self.hostView.allowPinchScaling = NO;
    [self.chartView addSubview:self.hostView];
    
}

-(void)configureGraph {
    
    // 1 - Create and initialize graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    self.hostView.hostedGraph = graph;
    graph.paddingLeft = 0.0f;
    graph.paddingTop = 0.0f;
    graph.paddingRight = 0.0f;
    graph.paddingBottom = 0.0f;
    graph.axisSet = nil;
    
    // 2 - Set up text style
    CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
    textStyle.color = [CPTColor grayColor];
    textStyle.fontName = @"Helvetica-Bold";
    textStyle.fontSize = 16.0f;
    
    // 3 - Configure title
//    NSString *title = @"Portfolio Prices: May 1, 2012";
//    graph.title = title;
//    graph.titleTextStyle = textStyle;
//    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
//    graph.titleDisplacement = CGPointMake(0.0f, -12.0f);
    
    graph.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
    
    graph.fill = nil;
    
}

-(void)configureChart {
    // 1 - Get reference to graph
    CPTGraph *graph = self.hostView.hostedGraph;
    // 2 - Create chart
    self.pieChart = [[CPTPieChart alloc] init];
    
//    self.pieChart.pieRadius = (self.hostView.bounds.size.width * 0.6) / 2;
    self.pieChart.pieRadius = self.pieRadius;
    self.pieChart.identifier = graph.title;
    self.pieChart.startAngle = M_PI_4;
    self.pieChart.sliceDirection = CPTPieDirectionClockwise;
    self.pieChart.labelOffset = -self.pieChart.pieRadius+30;
    
    // 3 - Create gradient
//    CPTGradient *overlayGradient = [[CPTGradient alloc] init];
//    overlayGradient.gradientType = CPTGradientTypeRadial;
//    overlayGradient = [overlayGradient addColorStop:[[CPTColor whiteColor] colorWithAlphaComponent:0.0] atPosition:0.85];
//    overlayGradient = [overlayGradient addColorStop:[[CPTColor whiteColor] colorWithAlphaComponent:0.4] atPosition:1.0];
//    self.pieChart.overlayFill = [CPTFill fillWithGradient:overlayGradient];
    // 4 - Add chart to graph
    [graph addPlot:self.pieChart];

}

-(void)configureLegend {
    
    CPTGraph *graph = self.hostView.hostedGraph;
    
    // 2 - Create legend
    CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
    
    // 3 - Configure legend
    
    CPTMutableTextStyle *textStyle = [[CPTMutableTextStyle alloc] init];
    [textStyle setColor:[CPTColor whiteColor]];
    [theLegend setBackgroundColor:[[UIColor clearColor] CGColor]];
    [theLegend setTextStyle:textStyle];
    [theLegend setNumberOfColumns:3];
    [theLegend setNumberOfRows:1];
    theLegend.swatchSize = CGSizeMake(25.0, 25.0);
    [graph setLegend:theLegend];
    [graph setLegendAnchor:CPTRectAnchorBottom];
//    [graph setLegendDisplacement:CGPointMake(10.0, 50.0)];
    
    
}

- (void)setDataSourceDelegate:(id<CPTPlotDataSource, UIActionSheetDelegate>)dataSourceDelegate{
    self.pieChart.dataSource = dataSourceDelegate;
    self.pieChart.delegate = dataSourceDelegate;
}


@end
