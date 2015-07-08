//
//  CustomSegmentedControl.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "CustomSegmentedControl.h"

@implementation CustomSegmentedControl


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    UIImage *transparentImage = [self imageWithColor: [UIColor clearColor]];

    [self setDividerImage:transparentImage
                       forLeftSegmentState:UIControlStateNormal
                         rightSegmentState:UIControlStateNormal
                                barMetrics:UIBarMetricsDefault];
    
    [self setDividerImage:transparentImage
                       forLeftSegmentState:UIControlStateSelected
                         rightSegmentState:UIControlStateNormal
                                barMetrics:UIBarMetricsDefault];
    
    [self setDividerImage: transparentImage
                       forLeftSegmentState:UIControlStateNormal
                         rightSegmentState:UIControlStateSelected
                                barMetrics:UIBarMetricsDefault];
    
    [self setBackgroundImage:transparentImage
                                     forState:UIControlStateNormal
                                   barMetrics:UIBarMetricsDefault];
    
    [self setBackgroundImage:transparentImage
                                     forState:UIControlStateSelected
                                   barMetrics:UIBarMetricsDefault];
    
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIColor whiteColor], NSForegroundColorAttributeName
                                                   ,[UIFont boldSystemFontOfSize:17], NSFontAttributeName
                                                   , nil] forState:UIControlStateNormal] ;
    
    
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIColor colorWithRed:(245.0/255.0) green:(211.0/255.0) blue:(41.0/255.0) alpha:1]
                                                   ,NSForegroundColorAttributeName,
                                                   [UIFont boldSystemFontOfSize:17], NSFontAttributeName
                                                   , nil] forState:UIControlStateSelected];
    
    self.transform = CGAffineTransformMakeRotation(M_PI / -2);
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



@end
