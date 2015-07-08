//
//  LeadSourceModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/6/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@protocol LeadSourceModel
@end

@interface LeadSourceModel : JSONModel

@property (strong, nonatomic) NSString *sourceName;
@property (strong, nonatomic) NSString *sourceValue;

@end
