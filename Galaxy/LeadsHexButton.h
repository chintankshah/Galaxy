//
//  LeadsHexButton.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/28/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAlphaVisibleThreshold (0.1f)

@interface LeadsHexButton : UIButton

@property (nonatomic, assign) CGPoint previousTouchPoint;
@property (nonatomic, assign) BOOL previousTouchHitTestResponse;
@property (nonatomic, strong) UIImage *buttonImage;
@property (nonatomic, strong) UIImage *buttonBackground;

- (void)updateImageCacheForCurrentState;
- (void)resetHitTestCache;


@end
