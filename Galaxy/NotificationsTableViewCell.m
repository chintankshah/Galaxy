//
//  NotificationsTableViewCell.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "NotificationsTableViewCell.h"

#define MESSAGE_TYPE 0
#define CAR_POOL_TYPE 1
#define FOOD_TYPE 2
#define MEETING_TYPE 3


@implementation NotificationsTableViewCell

- (void)awakeFromNib {
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)initWithNotificationsModel:(NotificationModel *)notifications{
    
    
    [self.notificationText setText: notifications.notificationText];
    
    switch (notifications.notificationType) {
       case MESSAGE_TYPE:
            [self.notificationType setImage:[UIImage imageNamed:@"Message Filled-100_656565.png"]];
            break;
            
        case CAR_POOL_TYPE:
            [self.notificationType setImage:[UIImage imageNamed:@"Car-100.png"]];
            break;
            
        case FOOD_TYPE:
            [self.notificationType setImage:[UIImage imageNamed:@"Food-100.png"]];
            break;
            
        case MEETING_TYPE:
            [self.notificationType setImage:[UIImage imageNamed:@"Meeting-100.png"]];
            break;
            
        default:
            [self.notificationType setImage:[UIImage imageNamed:@"Message Filled-100_656565.png"]];
            break;
    }

}

@end
