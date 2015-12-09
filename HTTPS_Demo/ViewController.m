//
//  ViewController.m
//  HTTPS_Demo
//
//  Created by FrankLiu on 15/12/8.
//  Copyright © 2015年 FrankLiu. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self networking];
}

- (void)networking {
    
    NSString * appleStr = @"https://www.apple.com/";
    
    NSString * kyfwStr = @"https://kyfw.12306.cn/otn/";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 使用自签名证书要用一下代码来验证,其他情况要注掉
//    manager.securityPolicy      = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//    manager.securityPolicy.validatesDomainName      = YES;
//    manager.securityPolicy.allowInvalidCertificates = YES;
    
    [manager GET:appleStr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"****JSON: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        NSLog(@"****Error: %@", error);
    }];
}

@end
