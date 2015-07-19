//
//  BaseViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/25/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "ContainerViewController.h"
#import "AppDelegate.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    self.backButton.layer.cornerRadius = self.backButton.bounds.size.width/2.0;

    self.child.view.bounds = self.wrapperView.bounds;
    [self addView:self.child.view ToParentView:self.wrapperView];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self.child = (BaseViewController*) [[NSClassFromString(nibNameOrNil) alloc] initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self.child) {
        
        if (self.dataObject != nil)
            self.child.dataObject = self.dataObject;
        
        [self addChildViewController:self.child];
    }
    
    return self;
}

- (IBAction)goBack:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController popViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dataObject:(id) dataObject
{
    if (dataObject != nil)
        self.dataObject = dataObject;
    
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

-(void)addView:(UIView *)view ToParentView:(UIView *) parentView{
    
    [parentView addSubview:view];
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:parentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:parentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:parentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:parentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}


@end
