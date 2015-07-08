//
//  TeamLeadModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/2/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@protocol TeamLeadModel
@end

@interface TeamLeadModel : JSONModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *pitched;

@end
