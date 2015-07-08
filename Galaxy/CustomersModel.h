//
//  CustomersModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "CustomerProfileModel.h"
#import "CustomerHistoryModel.h"
#import "ContactsModel.h"
#import "CustomerFeedArrayModel.h"

@protocol CustomersModel
@end

@interface CustomersModel : JSONModel

@property (strong, nonatomic) CustomerProfileModel* profile;
@property (strong, nonatomic) CustomerHistoryModel* history;
@property (strong, nonatomic) NSMutableArray<ContactsModel, ConvertOnDemand>* contacts;
@property (strong, nonatomic) NSMutableArray<CustomerFeedArrayModel, ConvertOnDemand>* news;

@end