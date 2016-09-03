//
//  SRNewFeaturesViewController.h
//  SRNewFeaturesDemo
//
//  Created by 郭伟林 on 16/9/3.
//  Copyright © 2016年 SR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRNewFeaturesViewController : UIViewController

/**
*  Whether to hide pageControl, default is NO which means show pageControl.
*/
@property (nonatomic, assign) BOOL hidePageControl;

/**
 *  Whether to hide skip Button, default is YES which means hide skip Button.
 */
@property (nonatomic, assign) BOOL hideSkipButton;

/** Default is `[UIColor orangeColor]`. */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

/** Default is `[UIColor lightGrayColor]`. */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

/**
 *  Only the first start app need show new features.
 *
 *  @return YES to show, NO not to show.
 */
+ (BOOL)sr_shouldShowNewFeature;

/**
 *  Create new features view controller with images
 *
 *  @param imageNames The image's name array.
 *
 *  @return SRNewFeatureViewController
 */
+ (instancetype)sr_newFeatureWithImageNames:(NSArray *)imageNames;

@end
