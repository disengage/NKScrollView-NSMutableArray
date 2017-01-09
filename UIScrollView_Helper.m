//
//  UIScrollView_Helper.m
//
//  Created by Narongsak kongpan on 5/21/15.
//  Copyright (c) 2015 Narongsak. All rights reserved.
//

#import "UIScrollView_Helper.h"

@implementation UIScrollView (UIScrollView_Helper)

-(void)addScrollViewLoading{
	[self setContentSize:CGSizeMake((self.frame.size.width * 1), self.frame.size.height)];
	for (UIView *each in self.subviews) {
		[each removeFromSuperview];
	}
	float scrollWidth = self.frame.size.width;
	float scrollHeight = self.frame.size.height;
	UIImageView *loadPageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, scrollHeight)];
	[loadPageView setContentMode:UIViewContentModeCenter];
	[loadPageView setAnimationImages:UIIMAGE_PROGRESS_LOAD];
	[loadPageView startAnimating];
	[self addSubview:loadPageView];
}

-(void)removeScrollViewLoading{
	for (UIView *each in self.subviews) {
		[each removeFromSuperview];
	}
}

-(void)addScrollViewRefreshWithTarget:(id)target selector:(SEL)selector{
	for (UIView *each in self.subviews) {
		[each removeFromSuperview];
	}
	float scrollWidth = self.frame.size.width;
	float scrollHeight = self.frame.size.height;
	UIButton *refresh = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, scrollHeight)];
	[refresh setImage:[UIImage imageNamed:@"icon_refresh"] forState:UIControlStateNormal];
	[refresh setContentMode:UIViewContentModeCenter];
	[refresh addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:refresh];
}

-(void)addButtonRefresh:(UIButton *)button withTarget:(id)target selector:(SEL)selector{
	[button setImage:[UIImage imageNamed:@"icon_refresh"] forState:UIControlStateNormal];
	[button setContentMode:UIViewContentModeCenter];
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

@end
