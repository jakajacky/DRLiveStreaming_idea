//
//  ViewController.m
//  DRLiveStream
//
//  Created by xqzh on 16/9/1.
//  Copyright © 2016年 xqzh. All rights reserved.
//

#import "ViewController.h"
#import "ShowTimeViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  // 判断是否是模拟器
  //  if ([[UIDevice deviceVersion] isEqualToString:@"iPhone Simulator"]) {
  //    [self showInfo:@"请用真机进行测试, 此模块不支持模拟器测试"];
  //    return NO;
  //  }
  //
  //  // 判断是否有摄像头
  //  if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
  //    [self showInfo:@"您的设备没有摄像头或者相关的驱动, 不能进行直播"];
  //    return NO;
  //  }
  
  // 判断是否有摄像头权限
  AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
  if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied) {
    //    [self showInfo:@"app需要访问您的摄像头。\n请启用摄像头-设置/隐私/摄像头"];
    //    return NO;
    NSLog(@"app需要访问您的摄像头。\n请启用摄像头-设置/隐私/摄像头");
  }
  
  // 开启麦克风权限
  AVAudioSession *audioSession = [AVAudioSession sharedInstance];
  if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
    [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
      if (granted) {
        //        return YES;
        
      }
      else {
        NSLog(@"app需要访问您的摄像头。\n请启用摄像头-设置/隐私/摄像头");
      }
    }];
  }
  
  
  UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
  ShowTimeViewController *showTimeVc = [story instantiateViewControllerWithIdentifier:@"show"];
  
  [self presentViewController:showTimeVc animated:YES completion:nil];
}

@end
