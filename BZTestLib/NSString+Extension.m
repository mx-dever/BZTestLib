//
//  NSString+Extension.m
//  LoveurMail
//
//  Created by Admin on 16/9/13.
//  Copyright © 2016年 成都倍智科技. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (BOOL)isLegalCharactor {
    return YES;
}
- (NSString *)firstCharactor
{
    //判断是否是中文
    NSRange range;
    for(int i = 0; i < self.length; i += range.length){
        range = [self rangeOfComposedCharacterSequenceAtIndex:i];
        NSString *s = [self substringWithRange:range];
        NSString *condition = @"^[a-zA-Z]";
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",condition];
        if ([pre evaluateWithObject:s]) {
            return s;
        }else{
            NSString *t = [self firstCharactorWithChinese:s];
            if ([pre evaluateWithObject:t]) {
                return t;
            }
        }
    }
    return @"";
}
//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)firstCharactorWithChinese:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str lowercaseString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}
@end
