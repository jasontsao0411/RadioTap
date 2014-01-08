//
//  RadioTapChannelModel.m
//  RadioTap
//
//  Created by Jason on 14-1-6.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import "RadioTapChannelModel.h"
#import "NYXImagesKit.h"
#import "RadioTapFrontiaDownloadArticle.h"


#define ArticleViewWidth 474.0f
#define ArticleViewHeight 128.0f
@interface RadioTapChannelModel()

@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation RadioTapChannelModel
@synthesize items = _items;

-(NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
        for (int i = 0; i < 5; i++)
        {
            [_items addObject:@(i)];
        }
    }
    return _items;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UIView *articleView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, ArticleViewWidth, ArticleViewHeight)];
    articleView.backgroundColor = [UIColor grayColor];
    articleView.tag = index;
    
    //Setup ImageView
    UIImage *articleImage = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",(unsigned long)index]];
    articleImage = [articleImage scaleByFactor:(ArticleViewWidth/articleImage.size.width)];
    articleImage = [articleImage cropToSize:CGSizeMake(ArticleViewWidth, ArticleViewHeight) usingMode:NYXCropModeCenter];
    UIImage *grayArticleImage = [articleImage grayscale];
    
    UIImageView *articleImageView = [[UIImageView alloc]initWithImage:grayArticleImage highlightedImage:articleImage];
    articleImageView.frame = CGRectMake(0.0f, 0.0f ,ArticleViewWidth, ArticleViewHeight);
    articleImageView.highlighted = 0;
    
    //Setup GrayTransparentMask
    UIImageView * grayMask = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 100.0f, ArticleViewWidth, 28.0f)];
    grayMask.alpha=0.7f;
    grayMask.backgroundColor = [UIColor blackColor];
    
    //Setup TopicLabel
    UILabel * TopicLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 100.0f, ArticleViewWidth, 28.0f)];
    TopicLabel.textAlignment = NSTextAlignmentCenter;
    TopicLabel.textColor = [UIColor whiteColor];
    TopicLabel.font = [UIFont fontWithName:@"Helvetica" size:19.0f];
    NSArray * topicArray = [[NSArray alloc]initWithObjects:@"Beatboxing May Be Safer Than Singing",@"Happy New Solar Ellipse!",@"Smell Delight or Disgust Lies in Genes", @"Penguin Groups Move Like Jammed Traffic",@"Baggage Screeners Detect Danger Better with More Danger to Detect", nil];
    TopicLabel.text = topicArray[arc4random()%5];
    
    
    //RadioTapFrontiaDownloadArticle * downloadModel = [[RadioTapFrontiaDownloadArticle alloc]init];
    //downloadModel.downloadButton.frame = CGRectMake(438.0f, 38.0f, 24.0f, 24.0f);
    
    JNJProgressButton * dButton = [[JNJProgressButton alloc]initWithFrame:CGRectMake(438.0f, 38.0f, 24.0f, 24.0f)];
    dButton.delegate = self;
    dButton.tintColor = [UIColor colorWithRed:255.0f/255.0f green:215.0f/255.0f blue:0/255 alpha:1.0f];
    dButton.startButtonImage = [UIImage imageNamed:@"Sunrise.png"];
    dButton.endButtonImage = [UIImage imageNamed:@"Sun.png"];

    
    [articleView addSubview:articleImageView];
    [articleView addSubview:grayMask];
    [articleView addSubview:TopicLabel];
    [articleView addSubview:dButton];
    return articleView;
}

-(NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
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
