//
//  ViewController.m
//  UIControlsWH26
//
//  Created by Nikolay Berlioz on 03.12.15.
//  Copyright © 2015 Nikolay Berlioz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef enum
{
    SelectImageControlTypeFirst,
    SelectImageControlTypeSecond,
    SelectImageControlTypeThird
}SelectImageControlType;

@implementation ViewController
{
    UIImage *image1;
    UIImage *image2;
    UIImage *image3;
    
    float scaleVar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    image1 = [UIImage imageNamed:@"1.png"];
    image2 = [UIImage imageNamed:@"2.png"];
    image3 = [UIImage imageNamed:@"3.png"];
    
    scaleVar = 1.2f;
    
    [self changeImage];
    
}
#pragma mark - Animations

#pragma mark - Private methods

- (void) changeImage
{
    if (self.selectImageControl.selectedSegmentIndex == SelectImageControlTypeFirst)
    {
        self.animationView.image = image1;
    }
    else if (self.selectImageControl.selectedSegmentIndex == SelectImageControlTypeSecond)
    {
        self.animationView.image = image2;
    }
    else
    {
        self.animationView.image = image3;
    }
}

#pragma mark - Actions

- (IBAction)actionSlider:(UISlider *)sender
{
    self.infoLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
}

- (IBAction)actionSelectImage:(UISegmentedControl *)sender
{
    
    [self changeImage];
}

- (IBAction)actionRotationSwitch:(UISwitch *)sender
{
    if (self.rotationSwitch.isOn)
    {
        [UIImageView animateWithDuration:self.changeSpeedSlider.value
                                   delay:0
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  self.animationView.transform = CGAffineTransformRotate(self.animationView.transform, M_PI_2);
                              } completion:^(BOOL finished) {
                                  [self actionRotationSwitch:sender];
                              }];
    }
}

- (IBAction)actionScaleSwitch:(UISwitch *)sender
{
    if (scaleVar == 2)
    {
        scaleVar = 0.5;
    }
    else
    {
        scaleVar = 2;
    }
    
    if (self.scaleSwitch.isOn)
    {
        [UIImageView animateWithDuration:self.changeSpeedSlider.value
                                   delay:0
                                 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                              animations:^{
                                  self.animationView.transform = CGAffineTransformScale(self.animationView.transform, scaleVar, scaleVar);
                              } completion:^(BOOL finished) {
                                  [self actionScaleSwitch:sender];
                              }];
    }
}

- (IBAction)actionTransltionSwitch:(UISwitch *)sender
{
    if (self.translationSwitch.isOn)
    {
        CGFloat pointX = arc4random() % (int)(CGRectGetMaxX(self.view.bounds) - 100) + 1;
        CGFloat pointY = arc4random() % (int)(CGRectGetMaxY(self.view.bounds) / 2 - 100) + 1;
        
        [UIImageView animateWithDuration:2
                                   delay:0
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  self.animationView.center = CGPointMake(pointX, pointY);
                              }
                              completion:^(BOOL finished) {
                                  [self actionTransltionSwitch:sender];
                              }];
    }
}

@end

