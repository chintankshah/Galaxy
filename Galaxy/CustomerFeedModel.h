//
//  CustomerFeedModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/8/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@protocol CustomerFeedModel
@end

@interface CustomerFeedModel : JSONModel

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *text;

@end
