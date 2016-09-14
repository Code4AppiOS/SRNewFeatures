# SRNewFeatures
**The rapid integration of showing new features**.

![image](./demoscreen.png)

## Usage
````objc
/**
 *  Create new features view controller with images.
 *
 *  @param imageNames The image's name array.
 *  @param rootVC     The key window's true root view controller.
 *
 *  @return SRNewFeatureViewController
 */
+ (instancetype)sr_newFeatureWithImageNames:(NSArray *)imageNames rootViewController:(UIViewController *)rootVC;
    }
````

 **You can seee more detail in project.** 

## Custom Settings
````objc
/**
*  Whether to hide pageControl, default is NO which means show pageControl.
*/
@property (nonatomic, assign) BOOL hidePageControl;

/**
 *  Whether to hide skip Button, default is YES which means hide skip Button.
 */
@property (nonatomic, assign) BOOL hideSkipButton;

/**
 *  Current page indicator tint color, default is [UIColor whiteColor].
 */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

/**
 *  Other page indicator tint color, default is [UIColor lightGrayColor].
 */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;
````

**If you have any question, please issue or contact me.**

**If you like it, please star me, thanks a lot.**

**Have Fun.**