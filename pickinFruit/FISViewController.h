//
//  FISViewController.h
//  pickinFruit
//
//  Created by Joe Burgess on 7/3/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *fruitsArray;
@property (strong, nonatomic) IBOutlet UIPickerView *fruitPicker;
@property (strong, nonatomic) IBOutlet UIButton *spinButton;

@end
