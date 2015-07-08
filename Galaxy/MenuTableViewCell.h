//
//  MenuTableViewCell.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *menuIcon;
@property (strong, nonatomic) IBOutlet UILabel *menuTitle;
@property (strong, nonatomic) IBOutlet UIView *wrapperView;

-(void)initWithMenuTitle:(NSString*)menuTitle :(int)menuIcon;

@end
