//
//  DataService.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/27/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeadArrayModel.h"
#import "NotificationArrayModel.h"
#import "TeamLeadSummaryModel.h"
#import "MyLeadSummaryModel.h"
#import "UpcomingMeetingModel.h"
#import "LeadStatusArrayModel.h"
#import "LeadSourceArrayModel.h"
#import "EmployeeListModel.h"
#import "CustomersArrayModel.h"
#import "CustomersModel.h"

@interface DataService : NSObject


-(LeadArrayModel*) getLeadsModel;
-(LeadArrayModel*) getFavoriteLeadsModel;
-(NotificationArrayModel*) getNotificationsModel;
-(TeamLeadSummaryModel*) getTeamLeadSummaryModel;
-(MyLeadSummaryModel*) getMyLeadSummaryModel;
-(UpcomingMeetingModel*) getUpcomingMeetingModel;
-(LeadStatusArrayModel*) getLeadStatusArrayModel;
-(LeadSourceArrayModel*) getLeadSourceArrayModel;
-(EmployeeListModel*) getEmployeeListModel;
-(CustomersArrayModel*) getAllCustomersModel;
-(CustomersArrayModel*) getMyCustomersModel;

-(CustomersModel*) test;
@end
