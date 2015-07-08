//
//  LeadsNotesTypeCollectionViewCell.m
//  Galaxy
//
//  Created by Shah, Chintan on 6/29/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import "LeadsNotesTypeCollectionViewCell.h"
#import "NotesTypeView.h"
#import "RecordingTypeView.h"

@implementation LeadsNotesTypeCollectionViewCell

- (void)awakeFromNib {
}

-(void) initWithNotesType: (NSString*) notesType{
    
    if ([notesType  isEqual: @"notes"]) {
        
        NSArray *bundleObjects;
        NotesTypeView *notesType;
        bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"NotesTypeView" owner:self options:nil];
        for (id object in bundleObjects) {
            if ([object isKindOfClass:[NotesTypeView class]]){
                notesType = (NotesTypeView *)object;
                break;
            }
        }
        
        [self addViewToContainerView:notesType];
    }
    else if ([notesType  isEqual: @"recording"]) {
        NSArray *bundleObjects;
        RecordingTypeView *recordingType;
        bundleObjects = [[NSBundle mainBundle] loadNibNamed:@"RecordingTypeView" owner:self options:nil];
        for (id object in bundleObjects) {
            if ([object isKindOfClass:[RecordingTypeView class]]){
                recordingType = (RecordingTypeView *)object;
                break;
            }
        }
        
        [self addViewToContainerView:recordingType];
    }
}

-(void)addViewToContainerView: (UIView*)view{
    
    [self.containerView addSubview:view];
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.containerView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.containerView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.containerView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.containerView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:0.0]];
}



@end
