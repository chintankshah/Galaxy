//
//  CustomerDetailView.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/13/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "CustomerDetailView.h"

@implementation CustomerDetailView

- (void)drawTriangle:(int)index {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGFloat midPoint = [self getButtonMidPointForIndex:index];
    
    CGContextMoveToPoint   (ctx, midPoint-10, 20);
    CGContextAddLineToPoint(ctx, midPoint, 5);
    CGContextAddLineToPoint(ctx, midPoint+10, 20);
    CGContextClosePath(ctx);
    
    CGContextSetRGBFillColor(ctx, 77.0/255.0, 76.0/255.0, 90.0/255.0, 1);
    CGContextFillPath(ctx);
}

-(CGFloat) getButtonMidPointForIndex: (int)index{
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat buttonContainerViewWidth, buttonSpacing, buttonContainerViewOffset, midPoint;
    CGSize buttonSize;
    
    if (screenHeight < 600) {
        buttonSize = CGSizeMake(65.0, 80.0);
        buttonSpacing = 10;
        
    }else{
        buttonSize = CGSizeMake(80.0, 100.0);
        buttonSpacing = 10; 
    }
    
    buttonContainerViewWidth = (buttonSize.width*4) + (buttonSpacing*3);
    buttonContainerViewOffset = (screenWidth-20-buttonContainerViewWidth)/2;
    
    midPoint = (index*buttonSize.width) + (index*buttonSpacing) + (buttonSize.width/2);
    midPoint += buttonContainerViewOffset;
    
    return midPoint;
}


@end
