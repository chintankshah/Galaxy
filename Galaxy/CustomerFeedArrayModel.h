//
//  CustomerFeedArrayModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "CustomerFeedModel.h"

@protocol CustomerFeedArrayModel
@end

@interface CustomerFeedArrayModel : JSONModel

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSMutableArray<CustomerFeedModel, ConvertOnDemand>* feeds;

@end
