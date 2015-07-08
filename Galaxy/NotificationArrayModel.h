//
//  NotificationArrayModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/1/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "NotificationModel.h"

@interface NotificationArrayModel : JSONModel

@property (strong, nonatomic) NSArray<NotificationModel, ConvertOnDemand>* notifications;

@end
