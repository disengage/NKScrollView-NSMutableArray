//
//  NKScrollView+NSMutableArray.m
//  Narongsak kongpan
//
//  Created by Narongsak Kongpan on 1/25/13.
//  Copyright (c) 2013 Narongsak kongpan. All rights reserved.
//

#import "NKScrollView+NSMutableArray.h"

@implementation UIScrollView (NKScrollView_NSMutableArray)

+(id)NKScrollView_BindArrayCellPage:(NSArray*)array initWithTarget:(id)target inScrollView:(UIScrollView *)scrollView pageControl:(UIPageControl *)pageView scrollTag:(NSString *)scrollTagName itemPerPage:(int)itemPerPage{
	float scrollWidth = scrollView.frame.size.width;
	float scrollHeight = scrollView.frame.size.height;

	int itemCount = (int)[array count];
    CGFloat maxColumnPerPage = 0;
    //CGFloat maxRowPerPage = 0;
    
	int indexInPage = 0;
	int indexInRow = 0;
	int currentPage = 0;
	int currentRow = 0;
    
    float cellWidth = 0;
    float cellHeight = 0;
    float contentHeight = 0;

	for(UIView *item in [scrollView subviews]){
		[item removeFromSuperview];
	}
    
	UIView *eachPageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, scrollHeight)];
    [eachPageView setBackgroundColor:[UIColor clearColor]];
    
	for (int count=0; count < itemCount; count++) {
		NSDictionary *eachDict = [array objectAtIndex:count];

		UIView *itemCell = [target performSelector:@selector(NKScrollViewCell:NSDictionary:)
                                        withObject:scrollTagName
                                        withObject:eachDict];
		cellWidth = [itemCell frame].size.width;
		cellHeight = [itemCell frame].size.height;
        
        maxColumnPerPage = floor(scrollWidth / cellWidth);
        //maxRowPerPage = ceil(scrollHeight / cellHeight);

		int x = (cellWidth * indexInRow);
		int y = (currentRow * cellHeight);
		if(x > (scrollWidth - cellWidth)){
			currentRow++;
			indexInRow = 0;
			x = 0;
			y = (currentRow * cellHeight);
            contentHeight += cellHeight;
		}

		[itemCell setFrame:CGRectMake(x, y, cellWidth, cellHeight)];
		[eachPageView addSubview:itemCell];
        
        if ([target respondsToSelector:@selector(NKScrollViewCell:attributes:)]) {
            NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
            [attrDict setValue:itemCell forKey:@"Cell"];
            [attrDict setValue:eachDict forKey:@"Dict"];
            [attrDict setValue:[NSString stringWithFormat:@"%i",currentPage] forKey:@"PageIndex"];
            [attrDict setValue:[NSString stringWithFormat:@"%i",currentRow] forKey:@"RowIndex"];
            [attrDict setValue:[NSString stringWithFormat:@"%i",count] forKey:@"SourceIndex"];
            [attrDict setValue:[NSString stringWithFormat:@"%i",indexInPage] forKey:@"Index"];
            [target performSelector:@selector(NKScrollViewCell:attributes:) withObject:scrollTagName withObject:attrDict];
        }
        
		indexInPage++;
		indexInRow++;

		if(indexInPage == itemPerPage){
            indexInPage = 0;
			currentRow = 0;
			indexInRow = 0;
			currentPage++;
            
			[scrollView addSubview:eachPageView];
            
            eachPageView = [[UIView alloc] initWithFrame:CGRectMake((currentPage * scrollWidth), 0, scrollWidth, scrollHeight)];
            [eachPageView setBackgroundColor:[UIColor clearColor]];
		}
	}
    
	if(indexInPage > 0){//Add Left View
		[scrollView addSubview:eachPageView];
        contentHeight += cellHeight;
        currentPage++;
	}
    
    if (currentPage > 1) {
        [scrollView setContentSize:CGSizeMake((scrollWidth * currentPage), scrollHeight)];
    }else{
        contentHeight = (itemCount / maxColumnPerPage);
        contentHeight = ceil(contentHeight) * cellHeight;
        if(contentHeight < scrollHeight){
            contentHeight = scrollHeight;
        }
        [scrollView setContentSize:CGSizeMake(scrollWidth, contentHeight)];
        eachPageView = [[scrollView subviews] objectAtIndex:0];
        [eachPageView setFrame:CGRectMake(0, 0, scrollWidth, contentHeight)];
    }
    
	if(pageView != nil){
		pageView.numberOfPages = currentPage;
	}
    
	return scrollView;
}

@end
