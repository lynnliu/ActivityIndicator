//
//  ViewController.m
//  ActivityIndicator
//
//  Created by Lynn on 10/23/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import "ViewController.h"
#import "ULynnAnimations.h"

#define itemSize 100.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BCKCOLOR;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    ThreeDotsScaleAnimation *dots = [[ThreeDotsScaleAnimation alloc] init];
    UIView *dotsView = [[UIView alloc] initWithFrame:CGRectMake(50.0, itemSize, itemSize, itemSize)];
    [dots setupAnimationInLayer:dotsView.layer size:itemSize color:DOTCOLOR];
    [self.view addSubview:dotsView];
    
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
    
    ThreeBarScaleAnimation *barScale = [[ThreeBarScaleAnimation alloc] init];
    UIView *barScaleView = [[UIView alloc] initWithFrame:CGRectMake(50.0, itemSize * 3 + 100, itemSize, itemSize)];
    [barScale setupAnimationInLayer:barScaleView.layer size:itemSize color:DOTCOLOR];
    [self.view addSubview:barScaleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
