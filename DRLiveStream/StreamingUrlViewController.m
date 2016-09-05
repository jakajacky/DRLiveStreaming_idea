//
//  StreamingUrlViewController.m
//  DRLiveStream
//
//  Created by xqzh on 16/9/2.
//  Copyright © 2016年 xqzh. All rights reserved.
//

#import "StreamingUrlViewController.h"

@interface StreamingUrlViewController ()

@property (strong, nonatomic) IBOutlet UITextField *streamText;

@end

@implementation StreamingUrlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirm:(id)sender {
  [self dismissViewControllerAnimated:true completion:^{
    _urlStringBlock(_streamText.text);
  }];
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}


@end
