//
//  ViewController.h
//  UIControlsWH26
//
//  Created by Nikolay Berlioz on 03.12.15.
//  Copyright © 2015 Nikolay Berlioz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *animationView;
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *translationSwitch;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectImageControl;
@property (weak, nonatomic) IBOutlet UISlider *changeSpeedSlider;


- (IBAction)actionSlider:(UISlider *)sender;
- (IBAction)actionSelectImage:(UISegmentedControl *)sender;
- (IBAction)actionRotationSwitch:(UISwitch *)sender;
- (IBAction)actionScaleSwitch:(UISwitch *)sender;
- (IBAction)actionTransltionSwitch:(UISwitch *)sender;


@end

