//
//  LeadStatus.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@protocol LeadStatusModel
@end

@interface LeadStatusModel : JSONModel

@property (strong, nonatomic) NSString *statusName;
@property (strong, nonatomic) NSString *statusValue;

@end
