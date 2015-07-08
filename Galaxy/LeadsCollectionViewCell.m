//
//  LeadsCollectionViewCell.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/26/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadsCollectionViewCell.h"

#define CALL_TYPE 1
#define MAIL_TYPE 2


#define WARM_STATUS 1
#define HOT_STATUS 2


@implementation LeadsCollectionViewCell

- (void)awakeFromNib {
    
    [self initCell];
    
    self.image.layer.cornerRadius = self.imageWidthConstraint.constant/2;
    self.image.layer.masksToBounds = YES;
    
}

-(void)initCell{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        self.imageWidthConstraint.constant = 60;
        self.imageHeightConstraint.constant = 60;
        self.viewTopConstraint.constant = 30;
        
        [self.name setFont:[UIFont systemFontOfSize:14.0]];
        [self.company setFont:[UIFont systemFontOfSize:14.0]];
        [self.phone setFont:[UIFont systemFontOfSize:14.0]];
        [self.email setFont:[UIFont systemFontOfSize:14.0]];
        self.labelHeightConstraint.constant = 15;
        
        self.iconHeightConstraint.constant = 30;
        self.iconWidthConstraint.constant = 30;
    }
}

-(void)initializeCell:(LeadModel*)lead forIndex:(int)index{
    self.index = index;
    
    if (index%3==0) {
        self.cellContentView.backgroundColor = [UIColor colorWithRed:(236.0/255.0) green:(93.0/255.0) blue:(87.0/255.0) alpha:1]; //red
    }
    else if(index%3==1){
        self.cellContentView.backgroundColor = [UIColor colorWithRed:(220.0/255.0) green:(189.0/255.0) blue:(36.0/255.0) alpha:1]; //yellow
    }else{
        self.cellContentView.backgroundColor = [UIColor colorWithRed:(81.0/255.0) green:(167.0/255.0) blue:(250.0/255.0) alpha:1]; //blue
    }
    
    [self.image setImage:[UIImage imageNamed:lead.image]];
    [self.name setText:lead.name];
    [self.company setText:lead.companyName];
    [self.phone setText:lead.contact];
    [self.email setText:lead.email];
    
    
    switch (lead.preferredContactType) {
        case CALL_TYPE:
            
            [self.preferredContactType setImage:[UIImage imageNamed:@"Phone Filled-100.png"] forState: UIControlStateNormal];
            break;
            
        case MAIL_TYPE:
            
            [self.preferredContactType setImage:[UIImage imageNamed:@"Message Filled-100.png"] forState: UIControlStateNormal];
            break;
            
        default:
            
            [self.preferredContactType setImage:[UIImage imageNamed:@"Phone Filled-100.png"] forState: UIControlStateNormal];
            break;
            
    }
    
    
    switch (lead.status) {
        case WARM_STATUS:
            
            [self.statusIcon setImage:[UIImage imageNamed:@"Temperature Filled-100.png"] forState: UIControlStateNormal];
            break;
            
        case HOT_STATUS:
            
            [self.statusIcon setImage:[UIImage imageNamed:@"Hot Chocolate Filled-100.png"] forState: UIControlStateNormal];
            break;
            
        default:
            
            [self.statusIcon setImage:[UIImage imageNamed:@"Temperature Filled-100.png"] forState: UIControlStateNormal];
            break;
            
    }
    
    if(lead.isFavorite){
        [self.favoriteButton setImage:[UIImage imageNamed:@"Star Filled-100_fav.png"] forState:UIControlStateNormal];
    }else{
        [self.favoriteButton setImage:[UIImage imageNamed:@"Star Filled-100.png"] forState:UIControlStateNormal];
    }
    
    
}


- (IBAction)toggleEditAction:(id)sender {
//    [self.delegate didSelectEditAtIndex:self.index];
}
@end
