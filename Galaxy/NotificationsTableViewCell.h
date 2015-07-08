//
//  NotificationsTableViewCell.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationModel.h"

@interface NotificationsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextView *notificationText;
@property (strong, nonatomic) IBOutlet UIImageView *notificationType;


-(void)initWithNotificationsModel:(NotificationModel*)notifications;

@end
