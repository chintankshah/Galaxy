//
//  CustomersCollectionViewCell.m
//  Galaxy
//
//  Created by Shah, Chintan on 7/7/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "CustomersCollectionViewCell.h"
#import "CustomerProfileModel.h"

#define CALL_TYPE 1
#define MAIL_TYPE 2

@implementation CustomersCollectionViewCell

- (void)awakeFromNib {
    [self initCell];
}

-(void)initCell{
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        
        [self.name setFont:[UIFont systemFontOfSize:14.0]];
        [self.campaignValue setFont:[UIFont systemFontOfSize:14.0]];
        
        self.buttonHeightConstraint.constant = 30;
        self.buttonWidthConstraint.constant = 30;
        self.buttonContainerWidthConstraint.constant = 80;
        
    }else{
        
    }
    
    self.productAccountButton.layer.cornerRadius = 6;
    self.leadsButton.layer.cornerRadius = 6;
}

-(void)initializeCell:(CustomerProfileModel*)customerProfile forIndex:(int)index{

    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.index = index;
    
    if (index%4==0) {
        self.cellContentView.backgroundColor = [UIColor colorWithRed:(77.0/255.0) green:(76.0/255.0) blue:(90.0/255.0) alpha:1];
    }
    else if(index%4==1){
        self.cellContentView.backgroundColor = [UIColor colorWithRed:(22.0/255.0) green:(79.0/255.0) blue:(134.0/255.0) alpha:1];
    }
    else if(index%4==2){
        self.cellContentView.backgroundColor = [UIColor colorWithRed:(100.0/255.0) green:(71.0/255.0) blue:(73.0/255.0) alpha:1];
    }
    else{
        self.cellContentView.backgroundColor = [UIColor colorWithRed:(178.0/255.0) green:(105.0/255.0) blue:(88.0/255.0) alpha:1];
    }
    
    [self.name setText: customerProfile.name];
    [self.distanceLabel setText:customerProfile.distance];
    
    NSString *campaignValue = [NSString stringWithFormat:@"%@ %@", customerProfile.currency, customerProfile.campaignValue];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:campaignValue];
    UIFont *smallFont = [UIFont systemFontOfSize:12.0];
    UIFont *largeFont = [UIFont systemFontOfSize:36.0];
    UIFont *mediumFont = [UIFont systemFontOfSize:18.0];
    
    [attributedText addAttribute:NSFontAttributeName value:smallFont range:NSMakeRange(0, 2)];
    [attributedText addAttribute:NSFontAttributeName value:largeFont range:NSMakeRange(2, campaignValue.length-2)];
    [attributedText addAttribute:NSFontAttributeName value:mediumFont range:NSMakeRange(campaignValue.length-1, 1)];
    
    [self.campaignValue setAttributedText:attributedText];
    
    switch (customerProfile.preferredContactType) {
        
        case CALL_TYPE:
            
            [self.preferedContactButton setImage:[UIImage imageNamed:@"Phone Filled-100.png"] forState: UIControlStateNormal];
            break;
            
        case MAIL_TYPE:
            
            [self.preferedContactButton setImage:[UIImage imageNamed:@"Message Filled-100.png"] forState: UIControlStateNormal];
            break;
            
        default:
            
            [self.preferedContactButton setImage:[UIImage imageNamed:@"Phone Filled-100.png"] forState: UIControlStateNormal];
            break;
            
    }
    
    NSString *productAccounts;
    
    if (customerProfile.isAgent) {
        
        self.productAccountButton.backgroundColor = [UIColor colorWithRed:(80.0/255.0) green:(167.0/255.0) blue:(140.0/255.0) alpha:1];
        [self.productsAccountsHeading setText:@"ACCOUNTS"];
        
        productAccounts = [NSString stringWithFormat:@"%d",customerProfile.accountsCount];
        
    }else{
        
        self.productAccountButton.backgroundColor = [UIColor colorWithRed:(180.0/255.0) green:(106.0/255.0) blue:(226.0/255.0) alpha:1];
        [self.productsAccountsHeading setText:@"PRODUCTS"];
        
        productAccounts = [NSString stringWithFormat:@"%d",customerProfile.productCount];
        
    }
    
    
    NSMutableAttributedString *accountsAttributedText = [[NSMutableAttributedString alloc] initWithString:productAccounts];
    UIFont *font;
    
    
    if(screenHeight < 600){
        font = [UIFont systemFontOfSize:18.0];
    }else{
        font = [UIFont systemFontOfSize:22.0];
    }
    
    
    [accountsAttributedText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, productAccounts.length)];
    [accountsAttributedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, productAccounts.length)];
    
    [self.productAccountButton setAttributedTitle:accountsAttributedText forState:UIControlStateNormal];
    
    
    NSString *leadsCount = [NSString stringWithFormat:@"%d",customerProfile.leadCount];
    NSMutableAttributedString *leadsAttributedText = [[NSMutableAttributedString alloc] initWithString:leadsCount];
    [leadsAttributedText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, leadsCount.length)];
    [leadsAttributedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, leadsCount.length)];
    
    [self.leadsButton setAttributedTitle:leadsAttributedText forState:UIControlStateNormal];
    
}


@end
