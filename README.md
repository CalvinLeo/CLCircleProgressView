# CLCircleProgressView

## 环形进度条

demo是简单的环形进度条表示热量的摄入

![效果图](https://github.com/CalvinLeo/imageSource/blob/master/progressView.gif)

## CocoaPods

1. Add `pod 'CLCircleProgressView'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<CLCircleProgressView/CLProgressView.h\>.

## 使用方式


```objc
#import "ViewController.h"

#import "CLProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) CLProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLProgressView *progressView = [[CLProgressView alloc] initWithBackFrame:CGRectMake((self.view.frame.size.width - 200) * 0.5, 100, 200, 200) radius:80];
    
    //    progressView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    //    progressView.layer.cornerRadius = 10;
    
    progressView.trackWidth = 7;
    progressView.circleWidth = 9;
    progressView.circleColor = [UIColor orangeColor];
    progressView.contentFont = [UIFont systemFontOfSize:18];
    progressView.contentColor = [UIColor orangeColor];
    
    self.progressView = progressView;
    [self.view addSubview:progressView];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 350, 150, 100)];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    [slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

- (void)changeValue:(UISlider *)slider
{
    NSLog(@"%f", slider.value);
    self.progressView.progressValue = slider.value;
    if (self.progressView.progressValue == 0) {
        self.progressView.contentText = [NSString stringWithFormat:@"-- Kcal"];
    }
    else {
        self.progressView.contentText = [NSString stringWithFormat:@"%.2f Kcal", self.progressView.progressValue * 100];
    }
}
```
