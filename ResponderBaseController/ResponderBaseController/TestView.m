//
//  TestView.m
//  ResponderBaseController
//
//  Created by wujian on 6/27/16.
//  Copyright © 2016 wesk痕. All rights reserved.
//

#import "TestView.h"
#import "UIResponder+BaseController.h"
#import "ViewControllerProtocol.h"

@interface TestView ()

@property (nonatomic, strong) UIButton *testButton;
@end
@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.testButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _testButton.frame = self.bounds;
}

#pragma mark - ButtonEvent
- (void)testButtonClicked:(id)sender
{
//    if (self.baseController && [self.baseController respondsToSelector:@selector(testViewClicked)]) {
//        [self.baseController performSelector:@selector(testViewClicked)];
//    }
    
    [(id<ViewControllerProtocol>)self.baseController testViewClicked];
}

#pragma mark - setter
- (UIButton *)testButton
{
    if (_testButton == nil) {
        _testButton = [UIButton new];
        _testButton.backgroundColor = [UIColor redColor];
        [_testButton setTitle:@"test" forState:UIControlStateNormal];
        [_testButton addTarget:self action:@selector(testButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}
@end
