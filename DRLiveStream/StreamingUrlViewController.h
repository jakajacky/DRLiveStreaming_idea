//
//  StreamingUrlViewController.h
//  DRLiveStream
//
//  Created by xqzh on 16/9/2.
//  Copyright © 2016年 xqzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UrlBlock)(NSString *);

@interface StreamingUrlViewController : UIViewController

@property (copy, nonatomic) UrlBlock urlStringBlock;

@end
