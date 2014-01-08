//
//  RadioTapFrontiaDownloadArticle.m
//  RadioTap
//
//  Created by Jason on 14-1-7.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import "RadioTapFrontiaDownloadArticle.h"




@implementation RadioTapFrontiaDownloadArticle

-(JNJProgressButton *)downloadButton
{
    
    if (!_downloadButton) {
        _downloadButton = [[JNJProgressButton alloc]init];
        _downloadButton.delegate = self;
        _downloadButton.tintColor = [UIColor colorWithRed:255.0f/255.0f green:215.0f/255.0f blue:0/255 alpha:1.0f];
        _downloadButton.startButtonImage = [UIImage imageNamed:@"Sunrise.png"];
        _downloadButton.endButtonImage = [UIImage imageNamed:@"Sun.png"];
    }
    return _downloadButton;
}

- (void)progressButtonStartButtonTapped:(JNJProgressButton *)button
{
    // Begin doing the download action or whatever asyncronous thing you need to do. Then start updating the progress progerty on the button.
    [self downloadFullArticle];
    
}

- (void)progressButtonEndButtonTapped:(JNJProgressButton *)button
{
    // The button has reached the end of the progress and the user can now do whatever the action needed.
}

- (void)progressButtonDidCancelProgress:(JNJProgressButton *)button
{
    // The user has canceled the progress
}

-(void)downloadFullArticle
{
    
}

@end
