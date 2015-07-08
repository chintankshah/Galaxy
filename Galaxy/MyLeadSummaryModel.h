//
//  MyLeadSummaryModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/2/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@interface MyLeadSummaryModel : JSONModel

@property (strong, nonatomic) NSString* pitched;
@property (strong, nonatomic) NSString* inProposal;
@property (strong, nonatomic) NSString* target;
@property (strong, nonatomic) NSString* myLeads;
@property (strong, nonatomic) NSString* queued;

@end
