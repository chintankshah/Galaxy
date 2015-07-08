//
//  NotificationModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@protocol NotificationModel
@end

@interface NotificationModel : JSONModel

@property (assign, nonatomic) int notificationType;
@property (strong, nonatomic) NSString* notificationText;

@end
