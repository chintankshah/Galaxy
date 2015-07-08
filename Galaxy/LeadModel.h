//
//  LeadModel.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/26/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "JSONModel.h"
#import "LeadNotesModel.h"

@protocol LeadModel
@end

@interface LeadModel : JSONModel

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* companyName;
@property (strong, nonatomic) NSString* contact;
@property (strong, nonatomic) NSString* email;
@property (strong, nonatomic) NSString* image;
@property (assign, nonatomic) int status;
@property (assign, nonatomic) int preferredContactType;
@property (assign, nonatomic) int isFavorite;
@property (strong, nonatomic) NSArray<LeadNotesModel, ConvertOnDemand>* notes;


@end