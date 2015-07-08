//
//  CustomerHistoryModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "LastDealModel.h"

@protocol CustomerHistoryModel
@end

@interface CustomerHistoryModel : JSONModel

@property (assign, nonatomic) int won;
@property (assign, nonatomic) int queued;
@property (assign, nonatomic) int rejected;
@property (assign, nonatomic) int successRate;
@property (assign, nonatomic) int newLeads;
@property (assign, nonatomic) int openProposals;
@property (assign, nonatomic) int closed;
@property (strong, nonatomic) LastDealModel* lastDeal;

@end