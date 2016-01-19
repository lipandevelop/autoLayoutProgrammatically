//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    // Set up your views and constraints here
    
#pragma purpleBox
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [framingView addSubview:purpleBox];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                          attribute:NSLayoutAttributeRightMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                          attribute:NSLayoutAttributeBottomMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                            toItem:framingView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:305.0/500.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute multiplier:1
                                                           constant:50]];
    
    
#pragma redBox
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [framingView addSubview:redBox];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:1 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1 constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:150]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    
#pragma orangeBox1
    UIView *orangeBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    [framingView addSubview:orangeBox1];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeRight multiplier:1 constant:-10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeTop multiplier:1 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30]];

#pragma orangeBox2
    
    UIView *orangeBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    [framingView addSubview:orangeBox2];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeLeft multiplier:1 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeTop multiplier:1 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:70]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30]];

    
#pragma blueBox1
    
    UIView *blueBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox1];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
#pragma blueBox2
    
    UIView *blueBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox2];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0]];
    
    
#pragma blueBox3
    
    UIView *blueBox3 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox3];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0]];
    
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
