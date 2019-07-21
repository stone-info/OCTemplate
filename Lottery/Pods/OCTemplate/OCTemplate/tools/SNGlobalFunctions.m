//
//  SNGlobalFunctions.m
//  objc_template
//
//  Created by stone on 2019/4/6.
//  Copyright © 2019 stone. All rights reserved.
//

#import "SNGlobalFunctions.h"
#import "SNHexColor.h"
#import "SN.h"

UIImage *kImageWithName(NSString *name) {
  return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

CGFloat kDegreesToRadian(CGFloat angle) {
  return M_PI * (angle) / 180.0;
}

// table view

void registerForCellFromNib(__kindof UITableView *tableView, Class nibClass) {

  [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(nibClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(nibClass)];
}

void registerForHeaderFooterViewFromNib(__kindof UITableView *tableView, Class nibClass) {
  [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(nibClass) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass(nibClass)];
}

void registerForCellFromClass(__kindof UITableView *tableView, Class cellClass) {
  [tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

void registerForHeaderFooterViewFromClass(__kindof UITableView *tableView, Class headerFooterViewClass) {
  [tableView registerClass:headerFooterViewClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(headerFooterViewClass)];
}

__kindof UITableViewCell *dequeueForCell(__kindof UITableView *tableView, Class cellClass) {
  return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

__kindof UITableViewHeaderFooterView *dequeueForHeaderFooterView(__kindof UITableView *tableView, Class headerFooterViewClass) {
  return [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerFooterViewClass)];
}

void cellDifferentColor(__kindof UITableViewCell *cell, NSIndexPath *indexPath) {
  cell.contentView.backgroundColor = indexPath.row % 2 == 0 ?
    [UIColor colorWithRed:247 / 255.0 green:206 / 255.0 blue:166 / 255.0 alpha:1.0] :
    [UIColor colorWithRed:242 / 255.0 green:154 / 255.0 blue:76 / 255.0 alpha:1.0];
}

// collection view
void registerForCollectionCellFromNib(__kindof UICollectionView *collectionView, Class nibClass) {
  [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(nibClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(nibClass)];
}

void registerForCollectionCellFromClass(__kindof UICollectionView *collectionView, Class itemClass) {
  [collectionView registerClass:itemClass forCellWithReuseIdentifier:NSStringFromClass(itemClass)];
}

// -------------------------------------------
void registerForCollectionSectionHeaderFromClass(__kindof UICollectionView *collectionView, Class headerClass) {
  [collectionView registerClass:headerClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(headerClass)];
}

void registerForCollectionSectionFooterFromClass(__kindof UICollectionView *collectionView, Class footerClass) {
  [collectionView registerClass:footerClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(footerClass)];
}

void registerForCollectionSectionHeaderFromNib(__kindof UICollectionView *collectionView, Class headerClass) {
  [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(headerClass) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(headerClass)];
}

void registerForCollectionSectionFooterFromNib(__kindof UICollectionView *collectionView, Class footerClass) {
  [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(footerClass) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(footerClass)];
}

__kindof UICollectionReusableView *dequeueForCollectionSectionHeader(__kindof UICollectionView *collectionView, Class headerClass, NSIndexPath *indexPath) {
  return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(headerClass) forIndexPath:indexPath];
}

__kindof UICollectionReusableView *dequeueForCollectionSectionFooter(__kindof UICollectionView *collectionView, Class footerClass, NSIndexPath *indexPath) {
  return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(footerClass) forIndexPath:indexPath];
}

// -------------------------------------------

__kindof UICollectionViewCell *dequeueForCollectionCell(__kindof UICollectionView *collectionView, Class itemClass, NSIndexPath *indexPath) {
  return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(itemClass) forIndexPath:indexPath];
}

UIFont *kPingFangSCRegular(CGFloat size) {
  return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

UIFont *kPingFangSCMedium(CGFloat size) {

  return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

UIFont *kSystemFont(CGFloat size) {

  return [UIFont systemFontOfSize:size];
}

UIFont *kFont(NSString *fontFamily, CGFloat size) {

  return [UIFont fontWithName:fontFamily size:size];
}

id jsonLoads(NSString *jsonString) {
  if (!jsonString) { return nil; }
  if ([jsonString isEqualToString:@""]) { return @""; }
  NSData *data = sn.stringToData(jsonString);
  return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

NSString *toJsonString(id obj) {

  if (!obj) { return nil; }

  if (![NSJSONSerialization isValidJSONObject:obj]) { return @""; }

  NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:nil];

  if (!data) { return @""; }

  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];;
}


// #define toStringNSInteger(value) [NSString stringWithFormat:@"%ld",value]
// #define toStringCGFloat(value) [NSString stringWithFormat:@"%f",value]
// #define toStringObject(value) [NSString stringWithFormat:@"%@",value]
// #define toStringInt(value) [NSString stringWithFormat:@"%d",value]
// #define toStringLongLong(value) [NSString stringWithFormat:@"%lld",value]
// #define toStringCGRect(value) NSStringFromCGRect(value)
// #define toStringCGSize(value) NSStringFromCGSize(value)
// #define toStringCGPoint(value) NSStringFromCGSize(value)
// #define toStringClass(value) NSStringFromClass(value)

NSString *toStringNSInteger(NSInteger value) { return [NSString stringWithFormat:@"%i", value]; }

NSString *toStringCGFloat(CGFloat value) { return [NSString stringWithFormat:@"%f", value]; }

NSString *toStringObject(id value) { return [NSString stringWithFormat:@"%@", value]; }

NSString *toStringInt(int value) { return [NSString stringWithFormat:@"%d", value]; }

NSString *toStringLongLong(long long value) { return [NSString stringWithFormat:@"%lld", value]; }

NSString *toStringCGRect(CGRect value) { return NSStringFromCGRect(value); }

NSString *toStringCGSize(CGSize value) { return NSStringFromCGSize(value); }

NSString *toStringCGPoint(CGPoint value) { return NSStringFromCGPoint(value); }

NSString *toStringClass(Class value) { return NSStringFromClass(value); }

UIImage *kImageCutCircle(UIImage *image) {
  UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
  UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
  [path addClip];
  [image drawAtPoint:CGPointZero];
  UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return uiImage;
}

/**
 * 图片切缘 带 边框
 * 应用场景, 图片切缘 也想要圆之外区域的时候
 * @param image
 * @param borderWidth
 * @param borderColor
 * @return
 */
UIImage *kImageCutCircleWithBorder(UIImage *image, CGFloat borderWidth, UIColor *borderColor) {

  CGFloat radius = MIN(image.size.width, image.size.height) * 0.5;
  CGSize size = CGSizeMake((radius + borderWidth) * 2, (radius + borderWidth) * 2);

  UIGraphicsBeginImageContextWithOptions(size, NO, 0);
  {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width * 0.5, size.height * 0.5)
                                       radius:size.width * 0.5
                                       startAngle:kDegreesToRadian(0)
                                       endAngle:kDegreesToRadian(360)
                                       clockwise:YES];
    // UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
  }

  {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width * 0.5, size.height * 0.5)
                                       radius:size.width * 0.5 - borderWidth
                                       startAngle:kDegreesToRadian(0)
                                       endAngle:kDegreesToRadian(360)
                                       clockwise:YES];
    // UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height)];
    [path addClip];
  }

  // [self drawAtPoint:CGPointMake(borderWidth, borderWidth)];
  [image drawAtPoint:CGPointMake(borderWidth - (image.size.width * 0.5 - radius), borderWidth - (image.size.height * 0.5 - radius))];

  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  return newImage;
}

// + (UIImage *(^)(UIImage *))imageCutCircle {
// return ^UIImage *(UIImage *image) {
// UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
// UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
// [path addClip];
// [image drawAtPoint:CGPointZero];
// UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
// UIGraphicsEndImageContext();
// return uiImage;
// };
// }


// 无参和有LOG的不做 全局函数

@interface SNGlobalFunctions ()

@end

@implementation SNGlobalFunctions

@end
