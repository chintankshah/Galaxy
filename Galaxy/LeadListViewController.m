//
//  LeadViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/26/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadListViewController.h"
#import "DataService.h"
#import "LeadArrayModel.h"
#import "LeadModel.h"
#import "LeadsCollectionViewCell.h"
#import "AppDelegate.h"

@interface LeadListViewController ()

@end

@implementation LeadListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSegmentControl];
    [self getFavoriteLeadsData];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"LeadsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LeadsCollectionViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupSegmentControl{
    
    [self.leadSegmentedControl setWidth:180 forSegmentAtIndex:0];
    [self.leadSegmentedControl setWidth:180 forSegmentAtIndex:1];
}

#pragma CollectionView - Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.leadArrayModel != nil)
        return self.leadArrayModel.leads.count;
    else
        return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LeadsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LeadsCollectionViewCell" forIndexPath:indexPath];
    
    [cell initializeCell:(LeadModel *)self.leadArrayModel.leads[indexPath.row] forIndex:(int)indexPath.row];
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width, height;
    
    if(self.filtersLeadingSpaceContraint.constant == 0){
        width = self.view.frame.size.width-90;
    }else{
        width = self.view.frame.size.width-40;
    }

    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        height = 205;
    }else{
        height = 255;
    }
    
    CGSize cellsize = CGSizeMake(width, height);
    return cellsize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    id dataObject = (LeadModel *)self.leadArrayModel.leads[indexPath.row];
    
    ContainerViewController *leadDetailViewController = [[ContainerViewController alloc] initWithNibName:@"LeadDetailViewController" bundle:nil dataObject:dataObject];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:leadDetailViewController animated:YES];

}

#pragma IBActions

- (IBAction)indexChanged:(UISegmentedControl *)sender {
    
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    switch (selectedSegment) {
        case 0:
            [self getFavoriteLeadsData];
            [self.collectionView reloadData];
            break;
        case 1:
            [self getLeadsData];
            [self.collectionView reloadData];
            break;
    }

}

- (IBAction)addLeadAction:(id)sender {
    
    ContainerViewController *leadCreateViewController = [[ContainerViewController alloc] initWithNibName:@"LeadCreateViewController" bundle:nil];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:leadCreateViewController animated:YES];
    
}

- (IBAction)searchLeadAction:(id)sender {
}

- (IBAction)toggleFilters:(id)sender {
    
    [self.view setNeedsUpdateConstraints];
    
    if(self.filtersLeadingSpaceContraint.constant == 0){
        [self.filtersLeadingSpaceContraint setConstant:-50.0];
        [self.addbuttonConstrint setConstant:25.0];
    }else{
        [self.filtersLeadingSpaceContraint setConstant:0.0];
        [self.addbuttonConstrint setConstant:0.0];
    }
    
    [self.collectionView reloadData];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
        [self.collectionView reloadData];
    }  completion:^(BOOL finished){
//        [self.collectionView reloadData];
    }];
}

#pragma Service Delegates

-(void) getLeadsData{
    DataService *service = [[DataService alloc] init];
    self.leadArrayModel = [service getLeadsModel];
}

-(void) getFavoriteLeadsData{
    DataService *service = [[DataService alloc] init];
    self.leadArrayModel = [service getFavoriteLeadsModel];
}


@end
