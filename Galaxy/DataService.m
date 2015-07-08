//
//  DataService.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/27/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "DataService.h"
#import "CustomersModel.h"

@implementation DataService


-(LeadArrayModel*)getLeadsModel{
    
    LeadArrayModel *leadArrayModel;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Leads" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        leadArrayModel = [[LeadArrayModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to LeadArray Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return leadArrayModel;

}

-(LeadArrayModel*) getFavoriteLeadsModel{
    
    LeadArrayModel *leadArrayModel, *favLeads;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Leads" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        leadArrayModel = [[LeadArrayModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to LeadArray Model %@", error);
        
        favLeads = [[LeadArrayModel alloc]init];
        favLeads.leads = (NSMutableArray<LeadModel, ConvertOnDemand>*) [[NSMutableArray alloc] init];
        
        for (int i=0; i<leadArrayModel.leads.count; i++) {
            LeadModel *lead = leadArrayModel.leads[i];
            
            if(lead.isFavorite){
                [favLeads.leads addObject:lead];
            }
        }
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return favLeads;
}

-(NotificationArrayModel*) getNotificationsModel{
    
    NotificationArrayModel *notificationArrayModel;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Notifications" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        notificationArrayModel = [[NotificationArrayModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to NotificationArrayModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return notificationArrayModel;
}

-(TeamLeadSummaryModel*) getTeamLeadSummaryModel{
    TeamLeadSummaryModel *teamLeadSummaryModel;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"TeamLeadSummary" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        teamLeadSummaryModel = [[TeamLeadSummaryModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to TeamLeadSummaryModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return teamLeadSummaryModel;
}
-(MyLeadSummaryModel*) getMyLeadSummaryModel{
    MyLeadSummaryModel *myLeadSummaryModel;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"MyLeadSummary" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        myLeadSummaryModel = [[MyLeadSummaryModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to MyLeadSummaryModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return myLeadSummaryModel;
}


-(UpcomingMeetingModel*) getUpcomingMeetingModel{
    
    UpcomingMeetingModel *model;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"UpcomingMeeting" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        model = [[UpcomingMeetingModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to UpcomingMeetingModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return model;
}


-(LeadStatusArrayModel*) getLeadStatusArrayModel{
    
    LeadStatusArrayModel *model;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"LeadStatus" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        model = [[LeadStatusArrayModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to LeadStatusArrayModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return model;
}

-(LeadSourceArrayModel*) getLeadSourceArrayModel{
    
    LeadSourceArrayModel *model;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"LeadSource" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        model = [[LeadSourceArrayModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to LeadSourceArrayModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return model;
}

-(EmployeeListModel*) getEmployeeListModel{
    
    EmployeeListModel *model;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Employees" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        model = [[EmployeeListModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to EmployeeListModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return model;
}

-(CustomersArrayModel*) getAllCustomersModel{
    
    CustomersArrayModel *model;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Customers" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        model = [[CustomersArrayModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to CustomersArrayModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return model;
}

-(CustomersArrayModel*) getMyCustomersModel{
    
    CustomersArrayModel *model, *myCustomers;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Customers" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        model = [[CustomersArrayModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to CustomersModel Model %@", error);
        
        myCustomers = [[CustomersArrayModel alloc]init];
        
        myCustomers.customers = (NSMutableArray<CustomersModel, ConvertOnDemand>*) [[NSMutableArray alloc] init];
        
        for (int i=0; i<model.customers.count; i++) {
            
            CustomersModel *customer = model.customers[i];
            CustomerProfileModel *profile = customer.profile;
            
            if(profile.isMyCustomer){
                [myCustomers.customers addObject: customer];
            }
        }
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return myCustomers;
}

-(CustomersModel*) test{
    CustomersModel *model;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSError *error;
    
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    if(error == nil){
        
        model = [[CustomersModel alloc] initWithData:data error:&error];
        
        if(error != nil)
            NSLog(@"ERROR: Unable to convert JSON to CustomersModel Model %@", error);
        
        
    }else{
        NSLog(@"ERROR: Unable to get contents from file %@", path);
    }
    
    return model;

}

@end
