//
//  ViewController.h
//  EOCAFThreeClass
//
//  Created by EOC on 2017/6/23.
//  Copyright © 2017年 EOC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HttpsURL @"https://gripaymobile.mbank.net.cn/mfspmobilejson/json/lastversion.action"
//@"clientversion=6.0&clienttype=2";
/*
 
 Https = http + S
 
 
 1 加密之后变成 2  发给对方   2 解密后变成 1 （1， +）
 
 2 68 +     7  61
 
 https 先非对称加密方式， 把 对称加密的密钥传输过来 （握手）； 握手成功之后用对称加密方式进行通讯
 
 
 ////
 
 1 客户端发送 版本号+加密信息
 2 服务端收到信息之后， 刷选出 客户和服务端都支持的加密信息并发送给客服端
   2.1 然后 把公钥发送给客服端（公钥进行非对称加密）
 
 3 客服端收到信息之后，加密信息里面，随机选择密钥（对称加密密钥），并用 公钥加密发送给服务端
 
 4 服务器收到信息，用私钥进行机密，获取密钥（对称加密密钥）
 
 5 验证
 
 
 
 
 */
@interface ViewController : UIViewController




@end


