//
//  LeadSourceArrayModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "LeadSourceModel.h"

@interface LeadSourceArrayModel : JSONModel

@property (strong, nonatomic) NSArray<LeadSourceModel, ConvertOnDemand> *list;

@end
