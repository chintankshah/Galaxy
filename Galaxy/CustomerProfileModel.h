//
//  CustomerProfileModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "RecentlyPitchedModel.h"

@protocol CustomerProfileModel
@end

@interface CustomerProfileModel : JSONModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *campaignValue;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSString *contact;
@property (strong, nonatomic) NSString *email;
@property (assign, nonatomic) int preferredContactType;
@property (assign, nonatomic) int isMyCustomer;
@property (assign, nonatomic) int isAgent;
@property (strong, nonatomic) NSString *distance;
@property (strong, nonatomic) NSString *budgeted;
@property (strong, nonatomic) NSString *pitched;
@property (strong, nonatomic) NSMutableArray<RecentlyPitchedModel, ConvertOnDemand>* recentlyPitched;
@property (assign, nonatomic) int productCount;
@property (assign, nonatomic) int accountsCount;
@property (assign, nonatomic) int leadCount;

@end
