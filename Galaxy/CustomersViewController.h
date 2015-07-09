//
//  CustomersViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 7/7/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CustomersArrayModel.h"
#import "CustomSegmentedControl.h"
#import "CustomersCollectionViewCell.h"


@interface CustomersViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate, CustomersDelegate>

@property (strong, nonatomic) CustomersArrayModel *customersList;

@property (strong, nonatomic) IBOutlet CustomSegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIButton *createButon;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *filtersLeadingSpaceContraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *addbuttonConstrint;

- (IBAction)toggleFilters:(id)sender;
- (IBAction)indexChanged:(UISegmentedControl *)sender;

@end
