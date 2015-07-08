//
//  LeadsNotesTypeCollectionViewCell.h
//  Galaxy
//
//  Created by Shah, Chintan on 6/29/15.
//  Copyright (c) 2015 Shah, Chintan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeadsNotesTypeCollectionViewCell : UICollectionViewCell

@property(strong, nonatomic) id delegate;
@property (strong, nonatomic) IBOutlet UITextView *notesPreview;

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property(strong, nonatomic) NSString* notesType;

-(void) initWithNotesType: (NSString*) notesType;

@end
