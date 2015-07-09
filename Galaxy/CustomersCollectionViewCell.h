//
//  CustomersCollectionViewCell.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/7/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerProfileModel.h"


@protocol CustomersDelegate
-(void) didSelectCellAtIndex: (int) index;
@end

@interface CustomersCollectionViewCell : UICollectionViewCell

@property (assign, nonatomic) int index;
@property (strong, nonatomic) id<CustomersDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *cellContentView;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *campaignValue;
@property (strong, nonatomic) IBOutlet UILabel *campaignValueHeading;

@property (strong, nonatomic) IBOutlet UIButton *productAccountButton;
@property (strong, nonatomic) IBOutlet UIButton *leadsButton;

@property (strong, nonatomic) IBOutlet UILabel *productsAccountsHeading;
@property (strong, nonatomic) IBOutlet UILabel *leadsHeading;

@property (strong, nonatomic) IBOutlet UIButton *preferedContactButton;

@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonContainerWidthConstraint;

-(void)initializeCell:(CustomerProfileModel*)customerProfile forIndex:(int)index;

@end
