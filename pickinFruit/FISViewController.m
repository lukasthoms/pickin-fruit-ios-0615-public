//
//  FISViewController.m
//  pickinFruit
//
//  Created by Joe Burgess on 7/3/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

- (IBAction)spin:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.fruitsArray = @[@"Apple",@"Orange",@"Banana",@"Pear",@"Grape", @"Kiwi", @"Mango", @"Blueberry", @"Raspberry"];
//    self.fruitsArray = @[@"Apple", @"Orange"];
    self.fruitPicker.delegate = self;
    self.fruitPicker.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.fruitsArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.fruitsArray[row];
}



- (IBAction)spin:(id)sender {

    for (NSInteger i = 0; i<3; i++) {
        int randomRow = arc4random_uniform((u_int32_t)self.fruitsArray.count);
        [self.fruitPicker selectRow:randomRow inComponent:i animated:YES];
    }
    [self checkForWin];
}

- (void) checkForWin {
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Cool." style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) { }];
    if ([self.fruitPicker selectedRowInComponent:0] == [self.fruitPicker selectedRowInComponent:1] && [self.fruitPicker selectedRowInComponent:1] == [self.fruitPicker selectedRowInComponent:2]) {
        UIAlertController *winAlert = [UIAlertController alertControllerWithTitle:@"YOU WIN" message:@"I CAN'T BELIEVE YOU WON" preferredStyle:UIAlertControllerStyleAlert];
        
        [winAlert addAction:okButton];
        [self presentViewController:winAlert animated:YES completion:nil];
    } else {
        UIAlertController *loseAlert = [UIAlertController alertControllerWithTitle:@"Nah." message:@"You lost :(" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *reSpin = [UIAlertAction actionWithTitle:@"Respin" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self spin:nil];
        }];
        [loseAlert addAction:okButton];
        [loseAlert addAction:reSpin];
        [self presentViewController:loseAlert animated:YES completion:nil];
        
    }
}

@end
