//
//  CustomersArrayModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "CustomersModel.h"

@interface CustomersArrayModel : JSONModel

@property (strong, nonatomic) NSMutableArray<CustomersModel, ConvertOnDemand>* customers;

@end
