//
//  NotificationsView.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/30/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationsView : UIView

@property (strong, nonatomic) IBOutlet UILabel *pageTitle;
@property (strong, nonatomic) IBOutlet UILabel *badge;

@property (strong, nonatomic) IBOutlet UITableView *notificationsTableView;

@end
