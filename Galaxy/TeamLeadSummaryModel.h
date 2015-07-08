//
//  TeamLeadSummaryModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/2/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "TeamLeadModel.h"

@interface TeamLeadSummaryModel : JSONModel


@property (strong, nonatomic) NSArray<TeamLeadModel, ConvertOnDemand> *team;
@property (strong, nonatomic) NSString *target;
@property (strong, nonatomic) NSString *remaining;
@property (strong, nonatomic) NSString *pitched;
@property (strong, nonatomic) NSString *currency;
@end
