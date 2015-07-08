//
//  LeadNotesModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/30/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"

@protocol LeadNotesModel
@end

@interface LeadNotesModel : JSONModel

@property (strong, nonatomic) NSString* date;

@end
