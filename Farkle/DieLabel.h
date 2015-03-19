//
//  DiceLabel.h
//  Farkle
//
//  Created by Rockstar. on 3/19/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject>

- (void)onDieLabelTapped:(UILabel *)label;

@end

@interface DieLabel : UILabel
@property (nonatomic, assign) id <DieLabelDelegate> delegate;
@property BOOL isHeld;
- (void)roll;



@end
