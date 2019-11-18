//
//  EOCPercentCodeVC.m
//  EOCAFThreeClass
//
//  Created by EOC on 2017/6/23.
//  Copyright © 2017年 EOC. All rights reserved.
//

#import "EOCPercentCodeVC.h"

@interface EOCPercentCodeVC ()

@end

@implementation EOCPercentCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)eocCode{
    
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    /*
     根据RFC 3986的规定：URL百分比编码的保留字段分为：
     1.   :  #  [  ]  @  ?  /
     2.   !  $  &  '  (  )  *  +  ,  ; =
     ？和／在query表中允许不被转译，  :#[]@和!$&'()*+,;= 都要被转译,
     也就是在URLQueryAllowedCharacterSet中删除这些字符
     */
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    
    NSString *url = @"http://www.baidu.com/test=1=+&===中文==";
    //allowedCharacterSet = [NSMutableCharacterSet characterSetWithCharactersInString:@"http://"];
    
    NSString *urlT = [url stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
    
    NSString *urlOne = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *urlTwo = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"urlT:::%@",urlT);
    
    NSLog(@"urlOne:::%@",urlOne);
    NSLog(@"%@",urlTwo);
    
    
}


@end
