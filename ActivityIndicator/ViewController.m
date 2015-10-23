//
//  ViewController.m
//  ActivityIndicator
//
//  Created by Lynn on 10/23/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import "ViewController.h"
#import "ULynnAnimations.h"

#define itemSize 80.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    FourDotsScaleAnimation *fourDot = [[FourDotsScaleAnimation alloc] init];
    UIView *fourDotView = [[UIView alloc] initWithFrame:CGRectMake(50.0, itemSize, itemSize, itemSize)];
    [fourDot setupAnimationInLayer:fourDotView.layer size:itemSize color:DOTCOLOR];
    [self.view addSubview:fourDotView];
    
    PulseAnimation *pulsAnim = [[PulseAnimation alloc] init];
    UIView *pulseView = [[UIView alloc] initWithFrame:CGRectMake(220.0, itemSize, itemSize, itemSize)];
    [pulsAnim setupAnimationInLayer:pulseView.layer size:itemSize color:DOTCOLOR];
    [self.view addSubview:pulseView];
    
    DotTriangleAnimation *dotTriangle = [[DotTriangleAnimation alloc] init];
    UIView *dotTri = [[UIView alloc] initWithFrame:CGRectMake(50.0, itemSize * 2 + 50, itemSize, itemSize)];
    [dotTriangle setupAnimationInLayer:dotTri.layer size:itemSize color:DOTCOLOR];
    [self.view addSubview:dotTri];
    
    GridDotsAnimation *gridDots = [[GridDotsAnimation alloc] init];
    UIView *gridDotsView = [[UIView alloc] initWithFrame:CGRectMake(220.0, itemSize * 2 + 50, itemSize, itemSize)];
    [gridDots setupAnimationInLayer:gridDotsView.layer size:itemSize color:DOTCOLOR];
    [self.view addSubview:gridDotsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
