//
//  SNGlobalFunctions.h
//  objc_template
//
//  Created by stone on 2019/4/6.
//  Copyright © 2019 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNHexColor;

UIKIT_EXTERN UIImage *kImageWithName(NSString *name);

UIKIT_EXTERN CGFloat kDegreesToRadian(CGFloat angle);

//                              /* UITableView */
/************************************************************************************/
UIKIT_EXTERN void registerForCellFromNib(__kindof UITableView *tableView, Class nibClass);

UIKIT_EXTERN void registerForHeaderFooterViewFromNib(__kindof UITableView *tableView, Class nibClass);

UIKIT_EXTERN void registerForCellFromClass(__kindof UITableView *tableView, Class cellClass);

UIKIT_EXTERN void registerForHeaderFooterViewFromClass(__kindof UITableView *tableView, Class headerFooterViewClass);

UIKIT_EXTERN __kindof UITableViewCell *dequeueForCell(__kindof UITableView *tableView, Class cellClass);

UIKIT_EXTERN __kindof UITableViewHeaderFooterView *dequeueForHeaderFooterView(__kindof UITableView *tableView, Class headerFooterViewClass);

UIKIT_EXTERN void cellDifferentColor(__kindof UITableViewCell *cell, NSIndexPath *indexPath);

//                              /* UICollectionView */
/************************************************************************************/

UIKIT_EXTERN void registerForCollectionCellFromNib(__kindof UICollectionView *collectionView, Class nibClass);

UIKIT_EXTERN void registerForCollectionCellFromClass(__kindof UICollectionView *collectionView, Class itemClass);

UIKIT_EXTERN __kindof UICollectionViewCell *dequeueForCollectionCell(__kindof UICollectionView *collectionView, Class itemClass, NSIndexPath *indexPath);

UIKIT_EXTERN void registerForCollectionSectionHeaderFromClass(__kindof UICollectionView *collectionView, Class headerClass);

UIKIT_EXTERN void registerForCollectionSectionFooterFromClass(__kindof UICollectionView *collectionView, Class footerClass);

UIKIT_EXTERN void registerForCollectionSectionHeaderFromNib(__kindof UICollectionView *collectionView, Class headerClass);

UIKIT_EXTERN void registerForCollectionSectionFooterFromNib(__kindof UICollectionView *collectionView, Class footerClass);

UIKIT_EXTERN __kindof UICollectionReusableView *dequeueForCollectionSectionHeader(__kindof UICollectionView *collectionView, Class headerClass, NSIndexPath *indexPath);

UIKIT_EXTERN __kindof UICollectionReusableView *dequeueForCollectionSectionFooter(__kindof UICollectionView *collectionView, Class footerClass, NSIndexPath *indexPath);



//                              /* font */
/************************************************************************************/
UIKIT_EXTERN UIFont *kPingFangSCRegular(CGFloat size);

UIKIT_EXTERN UIFont *kPingFangSCMedium(CGFloat size);

UIKIT_EXTERN UIFont *kSystemFont(CGFloat size);

UIKIT_EXTERN UIFont *kFont(NSString *fontFamily, CGFloat size);

UIKIT_EXTERN NSString *toJsonString(id obj);

UIKIT_EXTERN id jsonLoads(NSString *jsonString);

//                              /* string */
/************************************************************************************/
UIKIT_EXTERN NSString *toStringNSInteger(NSInteger value);

UIKIT_EXTERN NSString *toStringCGFloat(CGFloat value);

UIKIT_EXTERN NSString *toStringObject(id value);

UIKIT_EXTERN NSString *toStringInt(int value);

UIKIT_EXTERN NSString *toStringLongLong(long long value);

UIKIT_EXTERN NSString *toStringCGRect(CGRect value);

UIKIT_EXTERN NSString *toStringCGSize(CGSize value);

UIKIT_EXTERN NSString *toStringCGPoint(CGPoint value);

UIKIT_EXTERN NSString *toStringClass(Class value);


//                              /* runtime print */
/************************************************************************************/
#define GLog(FORMAT, ...) do {printf("\033[1;7;48m %s \033[0m\n", [NSString stringWithFormat:FORMAT, ##__VA_ARGS__].UTF8String);} while (0);
#define STARTLog(FORMAT, ...) do {printf("<%s %s:%d>-:▼\n\033[1;97;42m %s \033[0m\n", [[NSDate.date dateByAddingTimeInterval:[NSTimeZone.systemTimeZone secondsFromGMTForDate:NSDate.date]].description substringWithRange:NSMakeRange(11, 8)].UTF8String, [NSString stringWithUTF8String:__FILE__].lastPathComponent.UTF8String, __LINE__, [NSString stringWithFormat:FORMAT, ##__VA_ARGS__].UTF8String);} while (0);
#define ENDLog(FORMAT, ...) do {printf("\033[1;97;42m %s \033[0m\n", [NSString stringWithFormat:FORMAT, ##__VA_ARGS__].UTF8String);} while (0);

#define printProperties(Class, obj) \
do {\
unsigned int    count;\
objc_property_t *properties = class_copyPropertyList(Class, &count);\
STARTLog(@"GROUP START ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■")\
for (int i = 0; i < count; i++) {\
objc_property_t property = properties[i];\
const char      *cName   = property_getName(property);\
NSString        *name    = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];\
GLog(@"%s.%@ = %@", #obj, name, [obj valueForKey:name]);\
}\
ENDLog(@"GROUP END ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■")\
} while (0);

#define printMethods(kls) \
do {\
STARTLog(@"GROUP START ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■")\
Class          cls        = kls;\
unsigned int   count      = 0;\
Method         *pMethod   = class_copyMethodList(cls, &count);\
NSInteger      length     = 0;\
NSInteger      typeLength = 0;\
NSMutableArray *arrM      = [NSMutableArray array];\
for (int       i          = 0; i < count; i++) {\
Method       pObjc_method  = pMethod[i];\
SEL          pSelector     = method_getName(pObjc_method);\
NSString     *methodName   = kStringFormat(@"-[%@]", NSStringFromSelector(pSelector));\
const char   *typeEncoding = method_getTypeEncoding(pObjc_method);\
int          argumentCount = method_getNumberOfArguments(pObjc_method);\
NSDictionary *obj          = @{@"methodName": methodName, @"typeEncoding": kStringFormat(@"%s", typeEncoding), @"argumentCount": @(argumentCount)};\
[arrM addObject:obj];\
length = MAX(methodName.length, length);\
typeLength = MAX(strlen(typeEncoding), typeLength);\
}\
\
[arrM sortUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {\
NSString *s1 = obj1[@"methodName"];\
NSString *s2 = obj2[@"methodName"];\
return [s1 compare:s2];\
}];\
\
for (NSUInteger i = 0; i < arrM.count; ++i) {\
NSDictionary *dict         = arrM[i];\
NSString     *methodName   = kStringFormat(kStringFormat(@"%%-%lis", length), [dict[@"methodName"] UTF8String]);\
NSString     *typeEncoding = kStringFormat(kStringFormat(@"%%-%lis", typeLength), [dict[@"typeEncoding"] UTF8String]);\
int          argumentCount = [dict[@"argumentCount"] intValue];\
char         *string       = "\033[1;7;48m %s\t%-10s%s \033[0m\n";\
printf(string, methodName.UTF8String, kStringFormat(@"%i", argumentCount).UTF8String, typeEncoding.UTF8String);\
}\
ENDLog(@"GROUP END ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■")\
} while (0);

//                              /* runtime print */
/************************************************************************************/
UIKIT_EXTERN UIImage *kImageCutCircle(UIImage *image);

UIKIT_EXTERN UIImage *kImageCutCircleWithBorder(UIImage *image, CGFloat borderWidth, UIColor *borderColor);




/***  end  *********************************************************************************/
NS_ASSUME_NONNULL_BEGIN

@interface SNGlobalFunctions : NSObject

@end

NS_ASSUME_NONNULL_END
