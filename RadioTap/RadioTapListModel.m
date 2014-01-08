//
//  RadioTapListModel.m
//  RadioTap
//
//  Created by Jason on 14-1-5.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import "RadioTapListModel.h"
#import "RadioTapChannelModel.h"
#define CenterChannelScale 1.5
#define LeftRightSpace 1.23
#define ChannelViewWidth 474.0f
#define ChannelViewHeight 768.0f

@interface RadioTapListModel()
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic) RadioTapChannelModel *channelModel;
@end

@implementation RadioTapListModel
@synthesize channelModel=_channelModel;
#pragma mark – initiation
-(RadioTapChannelModel *)channelModel
{
    if (!_channelModel) {
        _channelModel = [[RadioTapChannelModel alloc]init];
    }
    return _channelModel;
}
#pragma mark – delegate
-(NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    
    //set up data
    self.items = [NSMutableArray array];
    for (int i = 0; i < 10; i++)
    {
        [_items addObject:@(i)];
    }
    return [_items count];
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ChannelViewWidth, ChannelViewHeight)];
    view.backgroundColor = [UIColor whiteColor];
    //create new view if no view is available for recycling
    
    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ChannelViewWidth, ChannelViewHeight)];
    view.backgroundColor = [UIColor whiteColor];
    view.contentMode = UIViewContentModeCenter;
    label = [[UILabel alloc] initWithFrame:view.bounds];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [label.font fontWithSize:50];
    label.tag = 1;
    label.text = [_items[index] stringValue];
    //[view addSubview:label];

    
    
    //Create And Set Channel Carousel
    iCarousel *channelCarousel = [[iCarousel alloc]initWithFrame:CGRectMake(0.0f, ChannelViewHeight/6, ChannelViewWidth, ChannelViewHeight*5/6)];
    channelCarousel.type = iCarouselTypeLinear;
    channelCarousel.delegate = self.channelModel;
    channelCarousel.dataSource = self.channelModel;
    channelCarousel.tag = index;
    channelCarousel.vertical = YES;
    channelCarousel.clipsToBounds = YES;
    channelCarousel.stopAtItemBoundary = YES;
    channelCarousel.contentOffset = CGSizeMake(0.0f, -ChannelViewHeight*2/6);
    channelCarousel.bounceDistance = 0.1f;
    channelCarousel.centerItemWhenSelected = NO;
    [view addSubview:(UIView *)channelCarousel];
    
    
    
    
    return view;
}

#pragma mark – listStyle
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1f;
    }
    else if (option ==iCarouselOptionSpacing)
    {
        return 0.93f;
    }
    return value;
}

- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    const CGFloat centerItemZoom = CenterChannelScale;
    CGFloat spacing = [self carousel:carousel valueForOption:iCarouselOptionSpacing withDefault:1.0f];
    CGFloat absClampedOffset = MIN(1.0, fabs(offset));
    CGFloat fastClampedOffset = MIN(1.0, absClampedOffset*1.2f);
    CGFloat scaleFactor = 1.0 + fastClampedOffset * (1.0/centerItemZoom - 1.0);

    offset =offset * carousel.itemWidth * spacing;
    
    if (carousel.vertical)
    {
        transform = CATransform3DTranslate(transform, 0.0f, offset, -absClampedOffset);
    }
    else
    {
        transform = CATransform3DTranslate(transform, offset, 0.0f, -absClampedOffset);
    }
    
    transform = CATransform3DScale(transform, scaleFactor, scaleFactor, 1.0f);
    return transform;
}

@end
