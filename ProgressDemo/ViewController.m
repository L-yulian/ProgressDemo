//
//  ViewController.m
//  ProgressDemo
//
//  Created by 杨广军 on 2017/12/22.
//  Copyright © 2017年 杨广军. All rights reserved.
//

#import "ViewController.h"
#import "CycleView.h"

@interface ViewController ()
@property (nonatomic, strong) CycleView *cycle;
@property (nonatomic, strong) UILabel *progressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _cycle = [[CycleView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 400, 200, 30)];
    [slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    slider.value = 0;
    [self.view addSubview:_cycle];
    [self.view addSubview:slider];
    
    _progressLabel = [[UILabel alloc]init];
    _progressLabel.center = CGPointMake(100, 100);
    _progressLabel.bounds = CGRectMake(0, 0, 70, 30);
    _progressLabel.textColor = [UIColor whiteColor];
    _progressLabel.textAlignment = NSTextAlignmentCenter;
    [_cycle addSubview:_progressLabel];
    
    UISegmentedControl *control = [[UISegmentedControl alloc]initWithItems:@[@"环形",@"扇形"]];
    control.frame = CGRectMake(100, 450, 200, 50);
    [control addTarget:self action:@selector(changeStatus:) forControlEvents:UIControlEventValueChanged];
    control.selectedSegmentIndex = 0;
    [self.view addSubview:control];
}

- (void)changeProgress:(UISlider *)slider{
    [_cycle drawProgress:slider.value];
    _progressLabel.text = [NSString stringWithFormat:@"%.2f%%",slider.value*100];
}

- (void)changeStatus:(UISegmentedControl *)control{
    if (control.selectedSegmentIndex == 0) {
        _cycle.progressLayer.lineWidth = 10;
        _cycle.radius = 85;
    }else{
        _cycle.progressLayer.lineWidth = 80;
        _cycle.radius = 40;
    }
    [_cycle setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
