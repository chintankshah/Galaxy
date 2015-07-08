//
//  LeadDetailTableViewCell.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/29/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeadsNotesTypeCollectionViewCell.h"
#import "LeadDetailCollectionView.h"
#import "LeadModel.h"

//
//@interface LeadDetailCollectionView : UICollectionView
//
//@property (nonatomic, strong) NSIndexPath *indexPath;
//
//@end

@interface LeadDetailTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *dateText;

@property (strong, nonatomic) IBOutlet LeadDetailCollectionView *collectionView;

@property (strong, nonatomic) LeadNotesModel *leadNotes;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

-(void)initializeTableViewCellWithLeadNotes: (LeadNotesModel*) leadNotes forIndex: (int)index;

@end
