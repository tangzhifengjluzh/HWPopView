# HWPopView

[![CI Status](https://img.shields.io/travis/330200387@qq.com/HWPopView.svg?style=flat)](https://travis-ci.org/330200387@qq.com/HWPopView)
[![Version](https://img.shields.io/cocoapods/v/HWPopView.svg?style=flat)](https://cocoapods.org/pods/HWPopView)
[![License](https://img.shields.io/cocoapods/l/HWPopView.svg?style=flat)](https://cocoapods.org/pods/HWPopView)
[![Platform](https://img.shields.io/cocoapods/p/HWPopView.svg?style=flat)](https://cocoapods.org/pods/HWPopView)











![Gif](https://github.com/tangzhifengjluzh/HWPopView/blob/master/Example/gif/ScreenRecording_12-25-2019-14-34-59.gif)
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HWPopView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HWPopView'
```
## 用法
```ruby
在.h或.m文件导入 #import <UIViewController+Pop.h>
    UIButton *content = [UIButton buttonWithType:UIButtonTypeCustom];
    [content addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    content.backgroundColor = [UIColor redColor];
    content.frame = CGRectMake(0, 0, 300, 300);
    [self presentContent:content animated:YES completion:^{
        
    }];
    
    - (void)click:(UIButton *)sender
{
    if ([sender.superview isKindOfClass:[UIButton class]] && sender.superview.tag == 8888) {
        [sender.superview removeFromSuperview];
    }
}
```
## Author

330200387@qq.com, 330200387@qq.com

## License

HWPopView is available under the MIT license. See the LICENSE file for more info.
