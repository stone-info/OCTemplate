//
//  T091View.m
//  Example
//
//  Created by stone on 2019/7/14.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T091View.h"

@implementation T091View

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
  // Drawing code

  NSString *string = @"hello world\n你好吗 世界\nhello world\n你好吗 世界";

  NSShadow *shadow = NSShadow.new;

  shadow.shadowColor = HexRGBA(@"#FFA500", 1.0);

  shadow.shadowOffset = CGSizeMake(1, 1);
  
  NSDictionary *dict = @{
    NSFontAttributeName           : kPingFangSCRegular(30),
    NSForegroundColorAttributeName: HexRGBA(@"#FFC1C1", 1.0),
    NSStrokeColorAttributeName    : HexRGBA(@"#4FB753", 1.0),
    NSStrokeWidthAttributeName    : @1,
    NSShadowAttributeName         : shadow,
  };
  // [string drawAtPoint:CGPointZero withAttributes:dict]; // 不会自动换行
  [string drawInRect:rect withAttributes:dict]; // 自动换行

}
@end
