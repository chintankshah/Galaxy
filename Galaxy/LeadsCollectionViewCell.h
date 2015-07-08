//
//  LeadsCollectionViewCell.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/26/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeadArrayModel.h"
#import "LeadModel.h"

@protocol LeadDelegate
@optional
-(void)didSelectEditAtIndex:(int) index;
@end


@interface LeadsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIView *cellContentView;
@property (strong, nonatomic) IBOutlet UIButton *statusIcon;
@property (strong, nonatomic) IBOutlet UIButton *preferredContactType;
@property (strong, nonatomic) IBOutlet UIButton *favoriteButton;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *company;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *email;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *viewTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *labelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageWidthConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconHeightConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *iconWidthConstraint;

- (IBAction)toggleEditAction:(id)sender;

@property (nonatomic, assign) id<LeadDelegate> delegate;
@property int index;

-(void)initializeCell: (LeadModel*)lead forIndex:(int)index;

@end
