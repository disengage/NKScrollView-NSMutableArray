//
//  NKScrollView+NSMutableArray.h
//  Narongsak kongpan
//
//  Created by Narongsak Kongpan on 1/25/13.
//  Copyright (c) 2013 Narongsak kongpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NKScrollView_NSMutableArray_Protocol <NSObject>
@optional;
-(void)NKScrollViewCell:(NSString *)ScrollViewTagName attributes:(NSDictionary*)array;
@required
-(UIView*)NKScrollViewCell:(NSString*)ScrollViewTagName NSDictionary:(NSDictionary*)dict;
@end

@interface UIScrollView (NKScrollView_NSMutableArray)
{
    
}

@property (nonatomic, retain) id<NKScrollView_NSMutableArray_Protocol> delegate;

+(id)NKScrollView_BindArrayCellPage:(NSArray*)array initWithTarget:(id)target inScrollView:(UIScrollView*)scrollView pageControl:(UIPageControl*)pageView scrollTag:(NSString*)scrollTagName itemPerPage:(int)itemPerPage;

@end
