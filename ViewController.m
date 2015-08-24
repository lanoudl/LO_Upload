//
//  ViewController.m
//  UpLoad
//
//  Created by lzhr on 15/8/21.
//  Copyright (c) 2015年 ggs. All rights reserved.
//

#import "ViewController.h"
#define LOEncode(str) [str dataUsingEncoding:NSUTF8StringEncoding]
#define LONewLine @"\r\n"
#define LOFileBoundary @"LanOu3g"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)upload
{
    //非文件的其他详细参数
    NSDictionary *params = @{@"":@"",
                             @"":@"",
                             @"":@""};
    //获取文件路径
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"filename" withExtension:@"txt"];
   //转换成data类型
    NSData *data = [NSData dataWithContentsOfURL:url];
    //创建一个请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //发送请求
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    //获得MIMEType
    NSString *MIMEType = response.MIMEType;
    
    [self upload:@"filename.txt" mimeType:MIMEType fileData:data Params:params];
}

- (void)upload : (NSString *)filename mimeType:(NSString *)mimeType fileData : (NSData *)fileData Params : (NSDictionary *)dic
{
    //请求路径
    NSURL *url = [NSURL URLWithString:@"服务器地址"];
    //创建一个POST请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    //设置请求体
    NSMutableData *body = [NSMutableData data];
    
    //文件参数
    [body appendData:LOEncode(@"--")];
    body appendData:LOEncode()
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
