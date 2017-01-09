//
//  UIScrollView_Helper.h
//
//  Created by Narongsak kongpan on 5/21/15.
//  Copyright (c) 2015 Narongsak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIScrollView (UIScrollView_Helper)

#define UIIMAGE_PROGRESS_LOAD [NSArray arrayWithObjects:[UIImage imageNamed:@"loading_1.png"],[UIImage imageNamed:@"loading_2.png"],[UIImage imageNamed:@"loading_3.png"],[UIImage imageNamed:@"loading_4.png"],[UIImage imageNamed:@"loading_5.png"],[UIImage imageNamed:@"loading_6.png"],[UIImage imageNamed:@"loading_7.png"],[UIImage imageNamed:@"loading_8.png"],[UIImage imageNamed:@"loading_9.png"],nil]

-(void)addScrollViewLoading;
-(void)removeScrollViewLoading;
-(void)addScrollViewRefreshWithTarget:(id)target selector:(SEL)selector;
-(void)addButtonRefresh:(UIButton *)button withTarget:(id)target selector:(SEL)selector;

@end
