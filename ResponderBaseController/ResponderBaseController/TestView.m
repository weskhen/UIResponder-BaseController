//
//  TestView.m
//  ResponderBaseController
//
//  Created by wujian on 6/27/16.
//  Copyright © 2016 wesk痕. All rights reserved.
//

#import "TestView.h"
#import "NSObject+BaseController.h"
#import "ViewControllerProtocol.h"

#define C(instance, protocol, selector, message) if (instance && [instance respondsToSelector:selector]) {[(id<protocol>)(instance) message]; } else{  NSLog(@"the protocol method error: self.baseController:%@   cannot find selector:%@",NSStringFromClass([instance class]),NSStringFromSelector(selector));}


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


    C(self.baseController, ViewControllerProtocol, @selector(testViewClicked), testViewClicked);
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
