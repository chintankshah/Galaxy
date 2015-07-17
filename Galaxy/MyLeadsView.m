//
//  MyLeadsView.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "MyLeadsView.h"

@implementation MyLeadsView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        CGSize size = CGSizeMake(80.0, 100.0);
        [self setHexSize:size WithValueFont:18.0 LabelFontSize:10.0];
        
        self.hexValueHeightConstraint.constant = 20;
        self.view1TopConstraint.constant = 80.0;
        self.view2TopConstraint.constant = -12.0;
        self.view3TopConstraint.constant = -12.0;
        
        
        CGAffineTransform transform;
        transform = CGAffineTransformMakeTranslation(50, 88.5);
        [self.pitchedButton setTransform:transform];
        [self.pitched setTransform:transform];
        [self.pitchedLabel setTransform:transform];

        transform = CGAffineTransformMakeTranslation(-50, 88.5);
        [self.inProposalButton setTransform:transform];
        [self.inProposal setTransform:transform];
        [self.inProposalLabel setTransform:transform];
        
        transform = CGAffineTransformMakeTranslation(50, -88.5);
        [self.leadsButton setTransform:transform];
        [self.myLeads setTransform:transform];
        [self.myLeadsLabel setTransform:transform];
        
        transform = CGAffineTransformMakeTranslation(-50, -88.5);
        [self.queuedButton setTransform:transform];
        [self.queued setTransform:transform];
        [self.queuedLabel setTransform:transform];

    }else{
        
        CGAffineTransform transform;
        transform = CGAffineTransformMakeTranslation(70, 126.5);
        [self.pitchedButton setTransform:transform];
        [self.pitched setTransform:transform];
        [self.pitchedLabel setTransform:transform];
        
        transform = CGAffineTransformMakeTranslation(-70, 126.5);
        [self.inProposalButton setTransform:transform];
        [self.inProposal setTransform:transform];
        [self.inProposalLabel setTransform:transform];
        
        transform = CGAffineTransformMakeTranslation(70, -126.5);
        [self.leadsButton setTransform:transform];
        [self.myLeads setTransform:transform];
        [self.myLeadsLabel setTransform:transform];
        
        transform = CGAffineTransformMakeTranslation(-70, -126.5);
        [self.queuedButton setTransform:transform];
        [self.queued setTransform:transform];
        [self.queuedLabel setTransform:transform];
        
    }
    
    [UIView animateWithDuration:1 animations:^{
        
        [self.pitchedButton setTransform:CGAffineTransformIdentity];
        [self.pitched setTransform:CGAffineTransformIdentity];
        [self.pitchedLabel setTransform:CGAffineTransformIdentity];
        
    }];
    
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.25);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:1 animations:^{
            
            [self.inProposalButton setTransform:CGAffineTransformIdentity];
            [self.inProposal setTransform:CGAffineTransformIdentity];
            [self.inProposalLabel setTransform:CGAffineTransformIdentity];
            
        }];
    });
    
    dispatch_time_t delay2 = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.45);
    dispatch_after(delay2, dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:1 animations:^{
            
            [self.queuedButton setTransform:CGAffineTransformIdentity];
            [self.queued setTransform:CGAffineTransformIdentity];
            [self.queuedLabel setTransform:CGAffineTransformIdentity];
            
        }];
    });
    
    dispatch_time_t delay3 = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.65);
    dispatch_after(delay3, dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:1 animations:^{
            
            [self.leadsButton setTransform:CGAffineTransformIdentity];
            [self.myLeads setTransform:CGAffineTransformIdentity];
            [self.myLeadsLabel setTransform:CGAffineTransformIdentity];
            
        }];
    });
    
}

-(void)setHexSize:(CGSize)size WithValueFont:(CGFloat)fontsize LabelFontSize:(CGFloat) labelFontSize{
    
    self.hexContainerWidth.constant = (size.width*2)+20;
    self.hexContainerHeight.constant = size.height;
    
    self.hexWidth.constant = size.width;
    self.hexHeight.constant = size.height;
    
    [self.pitched setFont:[UIFont boldSystemFontOfSize:fontsize]];
    [self.inProposal setFont:[UIFont boldSystemFontOfSize:fontsize]];
    [self.target setFont:[UIFont boldSystemFontOfSize:fontsize]];
    [self.myLeads setFont:[UIFont boldSystemFontOfSize:fontsize]];
    [self.queued setFont:[UIFont boldSystemFontOfSize:fontsize]];
    
    [self.pitchedLabel setFont:[UIFont boldSystemFontOfSize:labelFontSize]];
    [self.inProposalLabel setFont:[UIFont boldSystemFontOfSize:labelFontSize]];
    [self.targetLabel setFont:[UIFont boldSystemFontOfSize:labelFontSize]];
    [self.myLeadsLabel setFont:[UIFont boldSystemFontOfSize:labelFontSize]];
    [self.queuedLabel setFont:[UIFont boldSystemFontOfSize:labelFontSize]];
    
}

-(void)initWithLeadSummaryModel:(MyLeadSummaryModel*) myLeadSummaryModel{
    
    [self.pitched setAttributedText: [self getAttributedText: myLeadSummaryModel.pitched]];
    [self.inProposal setAttributedText: [self getAttributedText: myLeadSummaryModel.inProposal]];
    [self.target setAttributedText: [self getAttributedText: myLeadSummaryModel.target]];
    [self.myLeads setText: myLeadSummaryModel.myLeads];
    [self.queued setText:myLeadSummaryModel.queued];
    
    self.quarterCollectionView.delegate = self.delegate;
    self.quarterCollectionView.dataSource = self.delegate;

}

- (IBAction)leftAction:(id)sender {
    [self.delegate showPrevious];
}

- (IBAction)rightAction:(id)sender {
    [self.delegate showNext];
}

-(NSMutableAttributedString*) getAttributedText: (NSString*) string{
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:string];
    UIFont *smallFont = [UIFont systemFontOfSize:18.0];
    [attributedText addAttribute:NSFontAttributeName value:smallFont range:NSMakeRange(string.length-1, 1)];

    return attributedText;
}

-(void)myLeadsAction:(id)sender{
    [self.delegate myLeadsAction:sender];
}

@end
