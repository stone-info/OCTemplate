//
//  SNHexColor.h
//  objc_template
//
//  Created by stone on 2019/4/6.
//  Copyright © 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

//                              /* Color */
/************************************************************************************/
UIKIT_EXTERN UIColor *HexRGBA(NSString *hex, CGFloat alpha);

UIKIT_EXTERN UIColor *HexRGB(NSString *hex);

NS_ASSUME_NONNULL_BEGIN

@interface SNHexColor : UIColor
+ (UIColor *)hexColorWithHex:(NSString *)hex;
+ (UIColor *)hexColorWithHex:(NSString *)hex alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
