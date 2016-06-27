//
//  ViewController.m
//  ResponderBaseController
//
//  Created by wujian on 6/27/16.
//  Copyright © 2016 wesk痕. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic, strong) TestView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - subViewEvent
- (void)testViewClicked
{
    NSLog(@"you clicked this test Button");
}

#pragma mark - setter
- (TestView *)testView
{
    if (_testView == nil) {
        _testView = [[TestView alloc] initWithFrame:CGRectMake(50, 100, 150, 50)];
    }
    return _testView;
}
@end
