//
//  MenuTableViewCell.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (void)awakeFromNib {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

-(void)initWithMenuTitle:(NSString*)menuTitle :(int)menuIcon{
    [self.menuTitle setText:menuTitle];
    
    switch (menuIcon) {
        case 0:
            [self.menuIcon setImage:[UIImage imageNamed:@"Group-100.png"]];
            [self.wrapperView setBackgroundColor:[UIColor colorWithRed:80.0/255.0 green:173.0/255.0 blue:92/255.0 alpha:1]];
            break;
            
        case 1:
            [self.menuIcon setImage:[UIImage imageNamed:@"Combo Chart-100.png"]];
            [self.wrapperView setBackgroundColor:[UIColor colorWithRed:191.0/255.0 green:129.0/255.0 blue:215.0/255.0 alpha:1]];
            break;
            
        case 2:
            [self.menuIcon setImage:[UIImage imageNamed:@"Car Filled-100.png"]];
            [self.wrapperView setBackgroundColor:[UIColor colorWithRed:243.0/255.0 green:186.0/255.0 blue:105.0/255.0 alpha:1]];
            break;
            
        case 3:
            [self.menuIcon setImage:[UIImage imageNamed:@"Elevator-100.png"]];
            [self.wrapperView setBackgroundColor:[UIColor colorWithRed:166.0/255.0 green:170.0/255.0 blue:169.0/255.0 alpha:1]];
            break;
            
        case 4:
            [self.menuIcon setImage:[UIImage imageNamed:@"RSS-100.png"]];
            [self.wrapperView setBackgroundColor:[UIColor colorWithRed:166.0/255.0 green:169.0/255.0 blue:122.0/255.0 alpha:1]];
            break;
            
        case 5:
            [self.menuIcon setImage:[UIImage imageNamed:@"Dancing Filled-100.png"]];
            [self.wrapperView setBackgroundColor:[UIColor colorWithRed:69.0/255.0 green:170.0/255.0 blue:190.0/255.0 alpha:1]];
            break;
            
        default:
            [self.menuIcon setImage:[UIImage imageNamed:@"Group-100.png"]];
            [self.wrapperView setBackgroundColor:[UIColor colorWithRed:80.0/255.0 green:173.0/255.0 blue:92/255.0 alpha:1]];
            break;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
