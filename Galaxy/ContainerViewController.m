//
//  BaseViewController.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/25/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "ContainerViewController.h"

#define RIGHT_GESTURE_LIMIT 50
#define MENU_HEIGHT 50
#define MENU_HEIGHT_IPHONE4_AND_BELOW 40

@interface ContainerViewController ()

@end


@implementation ContainerViewController

@synthesize globalPanGesture;
@synthesize contentViewLeadingConstraint;
@synthesize contentViewTrailingConstraint;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    self.child.view.bounds = self.wrapperView.bounds;
    [self addViewToWrapperView:self.child.view];
    
    globalPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGlobalPanGesture:)];
    [self.wrapperView addGestureRecognizer:globalPanGesture];
    
    if (self.navigationController!=nil)
        [globalPanGesture requireGestureRecognizerToFail:self.navigationController.interactivePopGestureRecognizer];
    
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dataObject:(id) dataObject
{
    if (dataObject != nil)
        self.dataObject = dataObject;
    
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}


-(void)handleGlobalPanGesture:(UIPanGestureRecognizer*)gestureRecognizer{
    
    CGPoint screenLocation = [gestureRecognizer locationInView:self.view];
    CGPoint location = [gestureRecognizer locationInView:gestureRecognizer.view];
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    CGPoint velocity = [gestureRecognizer velocityInView:gestureRecognizer.view];
    
//        NSLog(@"screenLocation.x : %f", screenLocation.x);
    //    NSLog(@"location.x : %f", location.x);
    //    NSLog(@"translation.x : %f", translation.x);
    
    if(velocity.x > 1500){
        //close right menu
        
        self.contentViewTrailingConstraint.constant = 0;
        self.menuTrailingConstraint.constant = 20;
        self.contentViewLeadingConstraint.constant = 0;
        
    }
    
    if(velocity.x < -1500){
        //open right menu
        
        self.contentViewTrailingConstraint.constant = self.view.bounds.size.width-RIGHT_GESTURE_LIMIT;
        self.menuTrailingConstraint.constant = self.view.bounds.size.width-RIGHT_GESTURE_LIMIT + 20;
        self.contentViewLeadingConstraint.constant = RIGHT_GESTURE_LIMIT-self.view.bounds.size.width;
    }
    
    
    if(gestureRecognizer.state == UIGestureRecognizerStateChanged && (location.x >= (self.view.bounds.size.width - RIGHT_GESTURE_LIMIT))){
        
        //transition effect for opening right menu
        if(translation.x < 0
           && self.view.bounds.size.width+translation.x > RIGHT_GESTURE_LIMIT
           && self.contentViewTrailingConstraint.constant != self.view.bounds.size.width-RIGHT_GESTURE_LIMIT){
            
            if(screenLocation.x < RIGHT_GESTURE_LIMIT
               && -translation.x < RIGHT_GESTURE_LIMIT){
                
                //do nothing
                
            }else{
                
                self.contentViewTrailingConstraint.constant = -translation.x;
                self.menuTrailingConstraint.constant = -translation.x + 20;
                self.contentViewLeadingConstraint.constant = translation.x;
                
            }
            
        }
        
        
        //transition effect for closing right menu
        if(translation.x > 0
           && self.view.bounds.size.width-translation.x > RIGHT_GESTURE_LIMIT
           && self.contentViewTrailingConstraint.constant > 0){
            
            if (screenLocation.x > self.view.bounds.size.width-RIGHT_GESTURE_LIMIT
                && self.view.bounds.size.width-RIGHT_GESTURE_LIMIT-translation.x > RIGHT_GESTURE_LIMIT) {
                
                //do nothing
                
            }else{
                                
                self.contentViewTrailingConstraint.constant = self.view.bounds.size.width-RIGHT_GESTURE_LIMIT-translation.x;
                self.menuTrailingConstraint.constant = self.view.bounds.size.width-RIGHT_GESTURE_LIMIT-translation.x + 20;
                self.contentViewLeadingConstraint.constant = RIGHT_GESTURE_LIMIT-self.view.bounds.size.width+translation.x;
                
            }
            
        }
    }
    
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateFailed) {
        
        //open right menu completely
        if(self.contentViewTrailingConstraint.constant > (self.view.bounds.size.width)/2
           && self.contentViewTrailingConstraint.constant != self.view.bounds.size.width-RIGHT_GESTURE_LIMIT){
            
            [UIView animateWithDuration:0.2 animations:^{
                
                self.contentViewTrailingConstraint.constant = self.view.bounds.size.width-RIGHT_GESTURE_LIMIT;
                self.menuTrailingConstraint.constant = self.view.bounds.size.width-RIGHT_GESTURE_LIMIT + 20;
                self.contentViewLeadingConstraint.constant = RIGHT_GESTURE_LIMIT-self.view.bounds.size.width;
                
                [self.view layoutIfNeeded];
                
            }];
            
            
        }else if(self.contentViewTrailingConstraint.constant <= (self.view.bounds.size.width)/2
                 && self.contentViewTrailingConstraint.constant != 0){
            //close right menu completely
            
            [UIView animateWithDuration:0.2 animations:^{
                
                self.contentViewTrailingConstraint.constant = 0;
                self.menuTrailingConstraint.constant = 20;
                self.contentViewLeadingConstraint.constant = 0;
                
                [self.view layoutIfNeeded];
                
            }];
        }
        
    }
    
}


-(void)addViewToWrapperView:(UIView *)view{
    
    [self.wrapperView addSubview:view];
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.wrapperView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.wrapperView
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    
    [self.wrapperView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeRight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.wrapperView
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    
    [self.wrapperView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.wrapperView
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:0.0]];
    
    [self.wrapperView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.wrapperView
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
