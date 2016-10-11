# SRNewFeatures

**The rapid integration of showing new features**.

![image](./show.gif)
![image](./show.png)

## Usage
````objc
if ([SRNewFeaturesViewController sr_shouldShowNewFeature]) {
    NSArray *imageNames = @[@"newfeature1.jpg", @"newfeature2.jpg", @"newfeature3.jpg", @"newfeature4.jpg"];
    SRNewFeaturesViewController *newFeaturesVC = [SRNewFeaturesViewController sr_newFeatureWithImageNames:imageNames
                                                                                       rootViewController:[ViewController new]];
    newFeaturesVC.hideSkipButton = NO; // show skip Button
    self.window.rootViewController = newFeaturesVC;
} else {
    self.window.rootViewController = [ViewController new];
}
````

## Custom Settings

````objc
/**
 Whether to hide pageControl, default is NO which means show pageControl.
 */
@property (nonatomic, assign) BOOL hidePageControl;

/**
 Whether to hide skip Button, default is YES which means hide skip Button.
 */
@property (nonatomic, assign) BOOL hideSkipButton;

/**
 Current page indicator tint color, default is [UIColor whiteColor].
 */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

/**
 Other page indicator tint color, default is [UIColor lightGrayColor].
 */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;
````

**If you have any question, please issue or contact me.**

**If you like it, please star me, thanks a lot.**

**Have Fun.**