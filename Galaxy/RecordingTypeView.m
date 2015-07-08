//
//  RecordingTypeView.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/2/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "RecordingTypeView.h"

@implementation RecordingTypeView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.playButton.layer.cornerRadius = self.playButton.layer.bounds.size.width/2;
    self.playButton.layer.borderWidth = 2;
    self.playButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.playButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
}


@end
