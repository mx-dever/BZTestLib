//
//  NSString+Extension.h
//  LoveurMail
//
//  Created by Admin on 16/9/13.
//  Copyright © 2016年 成都倍智科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

// 合法字符 (中文，英文，数字及其标点)
- (BOOL)isLegalCharactor;
//获取第一个字母
- (NSString *)firstCharactor;
@end
