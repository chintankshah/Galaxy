//
//  LeadDetailTableViewCell.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/29/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadDetailTableViewCell.h"
#import "LeadsNotesTypeCollectionViewCell.h"

@implementation LeadDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ( !(self = [super initWithCoder:aDecoder]) ) return nil;
    
    return self;
}

-(void)initializeTableViewCellWithLeadNotes: (LeadNotesModel*) leadNotes forIndex: (int)index{
    self.leadNotes = leadNotes;
    [self.dateText setText:self.leadNotes.date];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"LeadsNotesTypeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LeadsNotesTypeCollectionViewCell"];
    
    self.collectionView.indexPath = indexPath;
    [self.collectionView reloadData];
}


@end
