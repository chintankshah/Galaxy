//
//  LeadStatusArrayModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "LeadStatusModel.h"

@interface LeadStatusArrayModel : JSONModel

@property (strong, nonatomic) NSArray<LeadStatusModel, ConvertOnDemand> *list;

@end
