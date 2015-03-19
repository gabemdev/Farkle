//
//  ViewController.m
//  Farkle
//
//  Created by Rockstar. on 3/19/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController ()<DieLabelDelegate>
@property IBOutletCollection(DieLabel)NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property NSMutableArray *die;
@property NSMutableArray *selectedDies;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.die = [NSMutableArray new];
    self.selectedDies = [@[@"1", @"5"]mutableCopy];
    
    for (DieLabel *label in self.labels) {
        label.delegate = self;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onRollButtonPressed:(id)sender {
    for (DieLabel * label in self.labels) {
        [label roll];

    }
}

- (void)onDieLabelTapped:(UILabel *)label {

    
}

#pragma mark - Game Logic
/*
 Scoring: 
 You cannot count any of your points until you reach at least 500 points in a single round. 
 When you reach 500 points for the first time, you may choose to immediately end your turn to prevent losing the points.

 5's = 50 points
 1's = 100 points
 1,1,1 = 300 points
 2,2,2 = 200 points
 3,3,3 = 300 points
 4,4,4 = 400 points
 5,5,5 = 500 points
 6,6,6 = 600 points
 
 Four of a kind = 1,000 points
 Five of a kinds = 2,000 points
 Six of a kind = 3,000 points
 A stright of 1 - 6 = 1,500 points
 Three pairs = 1,500 points
 Four of a kind + a pair = 1,500
 Two sets of three of a kind = 2,500
 
 Game: 
 While its your turn, roll the dice. 
 Take out any dice worth points after each roll. 
 This forms your running score for the round.
 Roll the remaining dice, removing any dice worth points and adding them to your running total.
 If you are ever able to set aside all six dice, you may re-roll all of your dice and keep building your running total. 
 If you are unable to set aside any dice (no dice are worth points), you have Farkled. You lose your running point total and your turn is over. 
 
 Winning the game: 
 Be the first player to meet or exceed 10,000 points to start the end game sequence. Each other player has one turn to try to beat your score.
 */

- (void)checkTriplets {
    for (int n = 1; n <= 6; n++) {
        int number = 0;
        for (DieLabel *label in self.labels)
        {
            if (([label.text intValue] == n) && ![self.selectedDies containsObject:label])
            {
                number++;
            }
        }
        if (number >= 3) {
            [self.selectedDies addObject:[NSString stringWithFormat:@"%i", n]];
        }
    }
}





#pragma mark - Shake
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        for (DieLabel * label in self.labels) {
            [label roll];

        }
    }
}










@end
