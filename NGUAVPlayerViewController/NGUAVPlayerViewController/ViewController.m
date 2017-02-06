//
//  ViewController.m
//  NGUAVPlayerViewController
//
//  Created by 周文刚 on 2017/2/6.
//  Copyright © 2017年 周文刚. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (strong, nonatomic) AVPlayerViewController *playerController;
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVAudioSession *session;
@property (strong, nonatomic) NSString *urlString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.session = [AVAudioSession sharedInstance];
    [self.session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    self.player = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://v.imevos.com/Act-ss-mp4-hd/97adfc639ed14d7cbcadec8c27eb5d92/1486188644908.mp4"]];
    self.playerController = [[AVPlayerViewController alloc] init];
    self.playerController.player = self.player;
    self.playerController.videoGravity = AVLayerVideoGravityResizeAspect;
    self.playerController.allowsPictureInPicturePlayback = YES;
    self.playerController.showsPlaybackControls = true;
    
    [self addChildViewController:self.playerController];
    self.playerController.view.translatesAutoresizingMaskIntoConstraints = true;
    CGFloat height = 300;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.playerController.view.frame = CGRectMake(0, 0, width,height );
    
    [self.view addSubview:self.playerController.view];
    [self.playerController.player play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
