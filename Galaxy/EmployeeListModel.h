//
//  EmployeeListModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "EmployeeModel.h"

@interface EmployeeListModel : JSONModel

@property (strong, nonatomic) NSArray<EmployeeModel, ConvertOnDemand> *list;

@end
