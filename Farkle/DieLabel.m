//
//  DiceLabel.m
//  Farkle
//
//  Created by Rockstar. on 3/19/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

- (IBAction)onTapped:(UITapGestureRecognizer *)sender {
    [self.delegate onDieLabelTapped:self];
}

- (void)roll {
    if (!self.isHeld) {
        NSInteger random = arc4random_uniform(6) + 1;
        [self setText:[NSString stringWithFormat:@"%ld", (long)random]];
    }

}

@end
