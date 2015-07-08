//
//  LeadViewController.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/26/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LeadArrayModel.h"
#import "LeadModel.h"
#import "LeadsCollectionViewCell.h"
#import "CustomSegmentedControl.h"

@interface LeadListViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, LeadDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet CustomSegmentedControl *leadSegmentedControl;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIButton *createButon;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *filtersLeadingSpaceContraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *addbuttonConstrint;

- (IBAction)indexChanged:(UISegmentedControl *)sender;
- (IBAction)addLeadAction:(id)sender;
- (IBAction)searchLeadAction:(id)sender;
- (IBAction)toggleFilters:(id)sender;


@property (strong, nonatomic) LeadArrayModel *leadArrayModel;

@property BOOL isCellEdited;
@property NSInteger selectedCell;

@end
