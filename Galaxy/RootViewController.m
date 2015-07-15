//
//  RootViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/24/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "RootViewController.h"
#import "DashboardViewController.h"
#import "MenuTableViewCell.h"


@interface RootViewController ()

@end

@implementation RootViewController

#define RIGHT_GESTURE_LIMIT 50
#define MENU_HEIGHT 50
#define MENU_HEIGHT_IPHONE4_AND_BELOW 40

bool menuOpened = NO;
@synthesize menuTrailingConstraint;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuItems = [[NSArray alloc] initWithObjects:@"CUSTOMERS",@"LEADS",@"GREEN MILES",@"LIFT",@"FEEDS", @"FUN @ WORK", nil];
    
    self.menuButton.layer.cornerRadius = self.menuButton.bounds.size.width/2.0;
    
    [self setupMenu];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.contentView addGestureRecognizer:self.tapGesture];
    
    //    [self loadContentViewWith:@"DashboardViewController"];
    [self loadContentViewWith:@"CustomersViewController"];
//    [self loadContentViewWith:@"LeadViewController"];
    
}

-(void)setupMenu{
    
    [self.menu registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"MenuTableViewCell"];
    
    self.menuHeightConstraint.constant = 0;
    self.menuWidthConstraint.constant = 0;
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 17, 30, 2)];
    [view setUserInteractionEnabled:NO];
    [view setBackgroundColor:[UIColor whiteColor]];
    [view setTag:100];
    [view.layer setCornerRadius:2.0];
    
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(10, 24, 30, 2)];
    [view2 setUserInteractionEnabled:NO];
    [view2 setBackgroundColor:[UIColor whiteColor]];
    [view2 setTag:200];
    [view2.layer setCornerRadius:2.0];
    
    UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(10, 31, 30, 2)];
    [view3 setUserInteractionEnabled:NO];
    [view3 setBackgroundColor:[UIColor whiteColor]];
    [view3 setTag:300];
    [view3.layer setCornerRadius:2.0];
    
    [self.menuButton addSubview:view];
    [self.menuButton addSubview:view2];
    [self.menuButton addSubview:view3];
    
}

-(void)handleTapGesture:(UITapGestureRecognizer*)gestureRecognizer{
    if(menuOpened){
        [self toggleMenu:self];
    }
}

- (IBAction)toggleMenu:(id)sender {
    
    [self.view setNeedsUpdateConstraints];

    [UIView animateWithDuration:0.3 animations:^{
        if(menuOpened){
            self.menuHeightConstraint.constant = 0;
            self.menuWidthConstraint.constant = 0;
            
            UIView *view1 = [self.menuButton viewWithTag:100];
            CGAffineTransform transform = CGAffineTransformIdentity;
            [view1 setTransform:transform];
            
            UIView *view3 = [self.menuButton viewWithTag:300];
            [view3 setTransform:transform];
            
            UIView *view2 = [self.menuButton viewWithTag:200];
            [view2 setTransform:transform];
            view2.hidden = false;
        }else{
            
            CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
            
            //for iPhone 4s, iPhone 5 and iPhone 5
            if(screenHeight < 600){
                self.menuHeightConstraint.constant = self.menuItems.count*MENU_HEIGHT_IPHONE4_AND_BELOW;
                
            }else{
                self.menuHeightConstraint.constant = self.menuItems.count*MENU_HEIGHT;
                
            }
            self.menuWidthConstraint.constant = (self.view.bounds.size.width/2)+40;
            
            UIView *view1 = [self.menuButton viewWithTag:100];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 7.0);
            transform = CGAffineTransformRotate(transform, 70.0);
            [view1 setTransform:transform];
            
            UIView *view2 = [self.menuButton viewWithTag:200];
            CGAffineTransform transform2 = CGAffineTransformMakeTranslation(0, 50.0);
            [view2 setTransform:transform2];
//            view2.hidden = true;
            
            UIView *view3 = [self.menuButton viewWithTag:300];
            CGAffineTransform transform3 = CGAffineTransformMakeTranslation(0, -7.0);
            transform3 = CGAffineTransformRotate(transform3, -70.0);
            [view3 setTransform:transform3];
            
        }
        [self.view layoutIfNeeded];
        menuOpened = !menuOpened;
    }];
    
}


#pragma Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell" forIndexPath:indexPath];
    if(cell == nil){
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuTableViewCell"];
    }
    [cell initWithMenuTitle:self.menuItems[indexPath.row] :(int)indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self toggleMenu:self];
    NSString *destinationContentNib = nil;
    switch (indexPath.row) {
        case 0:
            
            destinationContentNib = @"CustomersViewController";
            break;
            
        case 1:
            
            destinationContentNib = @"LeadViewController";
            break;
            
        case 2:
            
            destinationContentNib = @"DashboardViewController";
            break;
            
        case 3:
            
            destinationContentNib = @"DashboardViewController";
            break;
            
        case 4:
            
            destinationContentNib = @"DashboardViewController";
            break;
            
        case 5:
            
            destinationContentNib = @"DashboardViewController";
            break;
            
        default:
            
            destinationContentNib = @"DashboardViewController";
            break;

    }
    
    if(destinationContentNib != nil)
        [self loadContentViewWith:destinationContentNib];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    //for iPhone 4s, iPhone 5 and iPhone 5
    if(screenHeight < 600){
        return MENU_HEIGHT_IPHONE4_AND_BELOW;
        
    }else{
        return MENU_HEIGHT;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - Gesture

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:
(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;
}

-(void)loadContentViewWith:(NSString *)nib{
    
    //create view controller from nib
    
    self.containerViewController = [[ContainerViewController alloc] initWithNibName:nib bundle:nil];
    
    //remove already existing sub view if exist
    NSArray *viewsToRemove = [self.contentView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    
    //add the present view and set the frame height
    [self.contentView addSubview:[self.containerViewController view]];
    CGRect childFrame = [self.containerViewController view].frame;
    childFrame.size.height = self.contentView.frame.size.height;
    childFrame.size.width = self.contentView.frame.size.width;
    self.containerViewController.view.frame = childFrame;
}

@end
