//
//  RadioTapViewController.m
//  RadioTap
//
//  Created by Jason on 14-1-5.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import "RadioTapViewController.h"
#import "RadioTapMyScene.h"
#import "RadioTapListModel.h"



@interface RadioTapViewController()
@property (nonatomic) RadioTapListModel * listModel;
@property (nonatomic) iCarousel *listCarousel;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation RadioTapViewController
@synthesize listModel = _listModel;
@synthesize listCarousel = _listCarousel;
#pragma mark – Alloc&Init&Config
- (iCarousel *)listCarousel
{
    if (!_listCarousel) {
        _listCarousel = [[iCarousel alloc]initWithFrame:self.view.bounds];
        _listCarousel.type = iCarouselTypeCustom;
        _listCarousel.delegate = self.listModel;
        _listCarousel.dataSource = self.listModel;
        _listCarousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _listCarousel.bounceDistance = 0.5f;
        _listCarousel.backgroundColor = [UIColor colorWithRed:232.0f/255.0f green:229.0f/255.0f blue:210.0f/255.0f alpha:1.0f];
        
    }
    return _listCarousel;
}
- (RadioTapListModel *)listModel
{
    if (!_listModel) {
        _listModel = [[RadioTapListModel alloc]init];
    }
    return _listModel;
}

#pragma mark – View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
// Configure the view.
//    SKView * skView = (SKView *)self.view;
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
// Create and configure the scene.
//    SKScene * scene = [RadioTapMyScene sceneWithSize:skView.bounds.size];
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//
// Present the scene.
//[skView presentScene:scene];
    
    NSString *mp3Path = [[NSBundle mainBundle] pathForResource:@"Clarity" ofType:@"mp3"];
    

//    PFQuery *musicQuery = [PFQuery queryWithClassName:@"MusicClass"];
//    //[musicQuery whereKey:@"musicFile" equalTo:@"Clarity1.mp3"];
//    [musicQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
//    {
//        if (!error)
//        {
//            for (PFObject *object in objects)
//            {
//                PFFile * retrieveFile = [object objectForKey:@"musicFile"];
//                [retrieveFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error)
//                {
//                    if (!error)
//                    NSLog(@"success");
//                    //[data writeToFile:mp3Path atomically:YES];
//                    NSError *ferror;
//                    NSURL *inUrl = [NSURL fileURLWithPath:mp3Path];
//                    DiracAudioPlayer *myPlayer = [[DiracAudioPlayer alloc]initWithContentsOfURL:inUrl channels:1 error:&ferror];
//                    [myPlayer play];
//                }progressBlock:^(int percentDone)
//                {
//                    NSLog(@"%i",percentDone);
//                }];
//            }
//        }
//    }];
  
    //add carousel to skview
    [self.view addSubview:self.listCarousel];
    

}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
