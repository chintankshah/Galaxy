//
//  LeadsModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/26/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "LeadModel.h"

@interface LeadArrayModel : JSONModel

@property (strong, nonatomic) NSMutableArray<LeadModel, ConvertOnDemand>* leads;

@end
