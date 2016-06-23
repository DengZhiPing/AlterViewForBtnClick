//
//  ViewController.m
//  AlterViewWithBtn
//
//  Created by dengzhiping on 16/6/21.
//  Copyright © 2016年 dengzhiping. All rights reserved.
//

#import "ViewController.h"
#import "DZPALterViewWithBtn.h"
@interface ViewController ()<DZPALterViewWithBtnDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchDown];
    btn.frame =CGRectMake(40, 40, 100, 100);
    [btn setTitle:@"点我" forState:0];
    [self.view addSubview:btn];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)btnPress {
    DZPALterViewWithBtn *alter = [[DZPALterViewWithBtn alloc]init];
    alter.delegate = self;
    [alter showAlterViewWithMessage:@"这是提示！！!"];
}

- (void)didClickButtonAtIndex:(NSUInteger)index{
    
    switch (index) {
        case 100:
            NSLog(@"Click Cancel");
            break;
        case 101:
            NSLog(@"Click OK");
            
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
