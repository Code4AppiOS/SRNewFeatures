//
//  SRNewFeaturesViewController.m
//  SRNewFeaturesDemo
//
//  Created by 郭伟林 on 16/9/3.
//  Copyright © 2016年 SR. All rights reserved.
//

#import "SRNewFeaturesViewController.h"

@interface SRNewFeaturesViewController () <UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
    UIButton *_skipButton;
    UIButton *_customButton;
}

@property (nonatomic, strong) NSArray *imageNames;

@end

@implementation SRNewFeaturesViewController

+ (BOOL)sr_shouldShowNewFeature {
    
    // the app version in the sandbox
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] stringForKey:@"CFBundleShortVersionString"];
    // the current app version
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    if ([currentVersion isEqualToString:lastVersion]) {
        return NO;
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleShortVersionString"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
}

+ (instancetype)sr_newFeatureWithImageNames:(NSArray *)imageNames {
    
    return [[self alloc] initWithImageNames:imageNames];
}

- (instancetype)initWithImageNames:(NSArray *)imageNames {
    
    if (self = [super init]) {
        _imageNames = imageNames;
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.imageNames.count > 0) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        [scrollView setDelegate:self];
        [scrollView setBounces:YES];
        [scrollView setPagingEnabled:YES];
        [scrollView setShowsHorizontalScrollIndicator:NO];
        [scrollView setFrame:self.view.bounds];
        [scrollView setContentSize:(CGSize){self.view.frame.size.width * self.imageNames.count, 0}];
        [self.view addSubview:scrollView];
        
        CGFloat imageW = self.view.frame.size.width;
        CGFloat imageH = self.view.frame.size.height;
        for (int i = 0; i < self.imageNames.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView setImage:[UIImage imageNamed:_imageNames[i]]];
            [imageView setFrame:(CGRect){imageW * i, 0, imageW, imageH}];
            [scrollView addSubview:imageView];
            if (i == self.imageNames.count - 1) { // 此处可以自行添加自定义Button切换根控制器.
                [imageView setUserInteractionEnabled:YES];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAciton)];
                [imageView addGestureRecognizer:tap];
            }
        }
        
        _pageControl = [[UIPageControl alloc] init];
        [_pageControl setNumberOfPages:self.imageNames.count];
        [_pageControl setHidesForSinglePage:YES];
        [_pageControl setUserInteractionEnabled:NO];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
        [_pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
        [_pageControl setFrame:CGRectMake(0, self.view.frame.size.height * 0.9, self.view.frame.size.width, 40)];
        [self.view addSubview:_pageControl];
        
        CGFloat margin = 10;
        _skipButton = [[UIButton alloc] init];
        _skipButton.frame = CGRectMake(self.view.frame.size.width - margin - 60, self.view.frame.size.height - margin - 40, 60, 30);
        _skipButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _skipButton.layer.cornerRadius = 15;
        _skipButton.layer.masksToBounds = YES;
        _skipButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        _skipButton.titleLabel.font = [UIFont systemFontOfSize:16];
        _skipButton.hidden = YES;
        [_skipButton setTitle:@"跳过" forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_skipButton addTarget:self action:@selector(skipBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_skipButton];
    }
}

- (void)tapAciton {
    
    UIViewController *newRootViewController = [UIStoryboard storyboardWithName:@"Main" bundle:nil].instantiateInitialViewController;
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow
                      duration:0.75f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [UIApplication sharedApplication].keyWindow.rootViewController = newRootViewController;
                    }
                    completion:nil];
}

- (void)skipBtnAction {
    
    [self tapAciton];
}

#pragma mark - Setters

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    
    [_pageControl setCurrentPageIndicatorTintColor:currentPageIndicatorTintColor];
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    
    _pageIndicatorTintColor = pageIndicatorTintColor;
    
    [_pageControl setPageIndicatorTintColor:pageIndicatorTintColor];
}

- (void)setHidePageControl:(BOOL)hidePageControl {
    
    _hidePageControl = hidePageControl;
    
    _pageControl.hidden = hidePageControl;
}

- (void)setHideSkipButton:(BOOL)hideSkipButton {
    
    _hideSkipButton = hideSkipButton;
    
    _skipButton.hidden = hideSkipButton;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    _pageControl.currentPage = page;
}

@end