//
//  LeadDetailViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/27/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadDetailViewController.h"
#import "LeadDetailTableViewCell.h"

#import "AppDelegate.h"

@interface LeadDetailViewController ()

@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

@implementation LeadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LeadDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"LeadDetailTableViewCell"];
    

    self.tableViewHeightConstraint.constant = self.view.bounds.size.height-320+100;
    
    self.image.layer.cornerRadius = self.imageWidthConstraint.constant/2;
    self.image.layer.masksToBounds = YES;
    
    self.preferedContactType.layer.cornerRadius = self.imageWidthConstraint.constant/2;
    self.preferedContactType.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.preferedContactType.layer.borderWidth = 2;
    self.status.layer.cornerRadius = self.status.bounds.size.width/2;
    
    [self.name setText:self.lead.name];
    [self.company setText:self.lead.companyName];
    [self.phone setText:self.lead.contact];
    [self.email setText:self.lead.email];
    [self.image setImage:[UIImage imageNamed:self.lead.image]];
    
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0.0,0,20.0,0);
}

- (void)initView{
    // Drawing code
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        self.imageHeightConstraint.constant = 60;
        self.imageWidthConstraint.constant = 60;
        
        self.imageContainerHeightConstraint.constant = 80;
        [self.preferedContactType setImageEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
        
        self.addNotesTitleHeightConstraint.constant = 40;
        self.notesViewHeightConstraint.constant = 40;
        
        [self.addNotesLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.addRecordingLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.addNotesTitle setFont:[UIFont systemFontOfSize:12.0]];
        [self.sendEmailLabel setFont:[UIFont systemFontOfSize:12.0]];
        
        [self.name setFont:[UIFont systemFontOfSize:24.0]];
        [self.email setFont:[UIFont systemFontOfSize:15.0]];
        [self.company setFont:[UIFont systemFontOfSize:15.0]];
        [self.phone setFont:[UIFont systemFontOfSize:15.0]];
        
        self.labelHeightConstraint.constant = 20;
        self.iconHeightConstraint.constant = 30;
        self.iconWidthConstraint.constant = 30;
        
    }else{
        
        [self.preferedContactType setImageEdgeInsets:UIEdgeInsetsMake(25, 25, 25, 25)];
        self.notesViewHeightConstraint.constant = 50;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma Table view



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lead.notes.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeadDetailTableViewCell *cell = (LeadDetailTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"LeadDetailTableViewCell"];
    
    if (!cell)
    {
        cell = [[LeadDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LeadDetailTableViewCell"];
        
    }
    
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    [cell initializeTableViewCellWithLeadNotes:self.lead.notes[indexPath.row] forIndex:(int)indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LeadsNotesTypeCollectionViewCell *cell = (LeadsNotesTypeCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"LeadsNotesTypeCollectionViewCell" forIndexPath:indexPath];

    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LeadsNotesTypeCollectionViewCell" owner:self options:nil];
        cell = (LeadsNotesTypeCollectionViewCell *) [nib objectAtIndex:0];
    }
    
    if (indexPath.row == 0) {
        [cell initWithNotesType:@"recording"];
    }else{
        [cell initWithNotesType:@"notes"];
    }
        
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.frame.size.width-20)/2;
    CGFloat height = 130;
    
    CGSize cellsize = CGSizeMake(width, height);
    return cellsize;
}


#pragma mark - UIScrollViewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    UICollectionView *collectionView = (UICollectionView *)scrollView;
    NSInteger index = collectionView.tag;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}


- (IBAction)moreMenuAction:(id)sender {
}

- (IBAction)toggleNotesViewAction:(id)sender {
    
    NSString *imageName = @"Minus-100.png";
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        if(self.notesViewHeightConstraint.constant == 40){
            self.notesViewHeightConstraint.constant = 270;
        }else{
            self.notesViewHeightConstraint.constant = 40;
            imageName = @"Plus-100.png";
        }
        
    }else{
        
        if(self.notesViewHeightConstraint.constant == 50){
            self.notesViewHeightConstraint.constant = 300;
        }else{
            self.notesViewHeightConstraint.constant = 50;
            imageName = @"Plus-100.png";
        }
        
    }
    
    
    
    [self.view setNeedsUpdateConstraints];
    [self.toggleNotesView setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.5f animations:^{
        [self.view layoutIfNeeded];
    }];
    
}
@end
