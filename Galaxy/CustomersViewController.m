//
//  CustomersViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/7/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "CustomersViewController.h"
#import "CustomersCollectionViewCell.h"
#import "LeadsCollectionViewCell.h"
#import "CustomersModel.h"
#import "CustomerProfileModel.h"
#import "DataService.h"
#import "CustomerDetailViewController.h"
#import "AppDelegate.h"

@interface CustomersViewController ()

@end

@implementation CustomersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSegmentControl];
    [self getAllCustomers];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CustomersCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CustomersCollectionViewCell"];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)setupSegmentControl{
    
    [self.segmentedControl setWidth:180 forSegmentAtIndex:0];
    [self.segmentedControl setWidth:180 forSegmentAtIndex:1];
}

#pragma CollectionView - Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.customersList != nil)
        return self.customersList.customers.count;
    else
        return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomersCollectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    CustomersModel *customer = self.customersList.customers[indexPath.row];
    [cell initializeCell:customer.profile forIndex:(int) indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width, height;
    
    if(self.filtersLeadingSpaceContraint.constant == 0){
        width = (self.view.frame.size.width-80)/2;
    }else{
        width = (self.view.frame.size.width-30)/2;
    }
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        height = 255;
    }else{
        height = 275;
    }
    
    CGSize cellsize = CGSizeMake(width, height);
    return cellsize;

}

-(void)didSelectCellAtIndex:(int)index{
    
    id dataObject = self.customersList.customers[index];
    
    ContainerViewController *customerDetailViewController = [[ContainerViewController alloc] initWithNibName:@"CustomerDetailViewController" bundle:nil dataObject:dataObject];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:customerDetailViewController animated:YES];
    
}

- (IBAction)toggleFilters:(id)sender {
    
    [self.view layoutIfNeeded];
    
    if(self.filtersLeadingSpaceContraint.constant == 0){
        [self.filtersLeadingSpaceContraint setConstant:-50.0];
        [self.addbuttonConstrint setConstant:25.0];
    }else{
        [self.filtersLeadingSpaceContraint setConstant:0.0];
        [self.addbuttonConstrint setConstant:0.0];
    }
    
    [self.collectionView reloadData];
    
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
        [self.collectionView reloadData];
    }  completion:^(BOOL finished){
        [self.collectionView reloadData];
    }];

}


- (IBAction)indexChanged:(UISegmentedControl *)sender {
    
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    switch (selectedSegment) {
        case 0:
            [self getAllCustomers];
            [self.collectionView reloadData];
            break;
        case 1:
            [self getMyCustomers];
            [self.collectionView reloadData];
            break;
    }
    
}

-(void) getAllCustomers{
    DataService *service = [[DataService alloc] init];
    self.customersList = [service getAllCustomersModel];
    
}

-(void) getMyCustomers{
    DataService *service = [[DataService alloc] init];
    self.customersList = [service getMyCustomersModel];
    
}

@end
