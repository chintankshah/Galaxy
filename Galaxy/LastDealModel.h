//
//  LastDeal.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@protocol LastDealModel
@end

@interface LastDealModel : JSONModel

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *leadName;
@property (strong, nonatomic) NSString *campaignName;
@property (strong, nonatomic) NSString *campaignDuration;

@end
