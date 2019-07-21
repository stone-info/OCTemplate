//
//  SNTools.h
//  006_UIAdvanced
//
//  Created by stone on 2018/8/2.
//  Copyright © 2018年 stone. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//                              /* SN */
/************************************************************************************/
#define sn SN

@class MBProgressHUD;

typedef void (^SNTaskBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SN : NSObject

// #if DEBUG
//
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wincomplete-implementation"
//
// + (id (^)(id))ivarDescription;
//
// #pragma clang diagnostic pop
//
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wincomplete-implementation"
//
// + (id (^)(id))shortMethodDescription;
//
// #pragma clang diagnostic pop
//
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wincomplete-implementation"
//
// + (id (^)(id))methodDescription;
//
// #pragma clang diagnostic pop
//
// #endif

+ (NSString *(^)(id))getClassName;

+ (BOOL (^)(__kindof NSObject *))isEmpty;

+ (double)SNDeviceSystemVersion;

+ (CGSize)SNDeviceScreenSize;

+ (UIImage *)imageNamedWithBundleName:(NSString *)bundleName imageName:(NSString *)imageName extension:(NSString *__nullable)extension;

+ (NSString *)randomString;

+ (UIColor *)randomColor;

+ (UIImage *(^)(NSString *))resizableImageWithImageName;

+ (UIImage *(^)(UIImage *))resizableImageWithImage;

+ (NSValue *(^)(CGRect))valueWithCGRect;

+ (NSValue *(^)(CGSize))valueWithCGSize;

+ (NSValue *(^)(CGPoint))valueWithCGPoint;

+ (NSValue *(^)(UIEdgeInsets))valueWithUIEdgeInsets;

+ (NSValue *(^)(CGFloat, CGFloat, CGFloat, CGFloat))valueWithRect;

+ (NSValue *(^)(CGFloat, CGFloat))valueWithSize;

+ (NSValue *(^)(CGFloat, CGFloat))valueWithPoint;

+ (NSValue *(^)(CGFloat, CGFloat, CGFloat, CGFloat))valueWithEdgeInsets;

+ (CGFloat (^)(CGFloat, UIImage *))suggestHeight;

+ (CGFloat (^)(CGFloat, UIImage *))suggestWidth;

+ (__kindof UITableViewCell *(^)(__kindof UITableView *, Class))dequeueForCell;

+ (__kindof UITableViewHeaderFooterView *(^)(__kindof UITableView *, Class))dequeueForHeaderView;

+ (__kindof UITableViewHeaderFooterView *(^)(__kindof UITableView *, Class))dequeueForFooterView;

void dispatchTimer(id target, double timeInterval, void (^handler)(dispatch_source_t timer));

// 主线程中执行
void setInterval(id target, void (^handler)(dispatch_source_t timer), uint64_t timeout);

// 主线程中执行
void setTimeout(id target, void (^handler)(dispatch_source_t timer), uint64_t timeout);

+ (MBProgressHUD *(^)(__kindof UIView *, NSString *))showHUD;

+ (void (^)(MBProgressHUD *))hideHUD;

+ (void (^)(NSString *, id))writeFile;

+ (id (^)(NSString *))readFile;

/**
 * @param obj
 * @param key
 * @return void
 */
+ (void (^)(__nullable id obj, NSString *key))writeToPreferences;

+ (__nullable id (^)(NSString *))readFromPreferences;

// <NSCoding>
+ (void (^)(id, NSCoder *))encode;

+ (void (^)(id, NSCoder *))decode;

+ (BOOL (^)(id, NSString *))archive;

+ (id (^)(NSString *))unarchive;

/** 16进制(字符串形式) 返回 图片 */
+ (UIImage *(^)(NSString *))imageWithString;

/** 16进制返回颜色 */
+ (UIColor *(^)(NSString *string))colorWithString;

/** 颜色 返回 图片 */
+ (UIImage *(^)(UIColor *))imageWithColor;

+ (NSString *(^)(NSData *))dataToString;

+ (NSData *(^)(NSString *))stringToData;

// url encoding
+ (NSString *(^)(NSString *))urlEncoding;

+ (NSString *(^)(NSString *))urlDecoding;

// json数据 -> OC对象 反序列化
+ (id(^)(NSData *))deserialization;

// json数据 -> OC对象 反序列化
+ (id(^)(NSData *, NSJSONReadingOptions))deserializationWithOptions;

// OC对象 -> JSON数据 序列化
+ (NSData *(^)(id))serialization;

+ (id(^)(NSString *))jsonFileToObject;

+ (UIImage *(^)(NSData *))dataToImage;

+ (NSUInteger (^)(NSString *filePath))fileSize;

+ (NSMutableURLRequest *(^)(NSString *, UIImage *))upload;

//=== md5 =================================/
+ (NSString *(^)(NSData *))md5WithData;

//计算字符串的MD5值，
+ (NSString *(^)(NSString *))md5WithString;

//计算大文件的MD5值
+ (NSString *(^)(NSString *))md5WithFilePath;
//====================================/

+ (NSString *)getFileMD5WithPath:(NSString *)path;

+ (NSString *)getMD5WithData:(NSData *)data;

+ (NSString *)getMD5WithString:(NSString *)string;

+ (NSString *(^)(NSString *))getMIMETypeWithMainQueue;

+ (void (^)(NSString *, void(^)(NSString *MIMEType)))getMIMETypeWithConcurrentQueue;

+ (NSString *(^)(NSString *))getMIMETypeWithSystem;

+ (NSString *(^)(NSString *))imageExtension;

+ (void)addRunLoopObserver;

+ (void)promiseAll:(void (^)(dispatch_group_t group, dispatch_queue_t queue))taskList completed:(void (^)(void))completed;

+ (void)promiseTestAll:(void (^)(dispatch_group_t group, dispatch_queue_t queue, NSMutableArray *errorGroup))taskList completed:(void (^)(NSMutableArray *errorGroup))completed;

+ (NSArray<NSString *> *(^)(NSString *, NSString *))split;

+ (BOOL (^)(NSString *))xibExists;

//____________2019-06-01___file manager______________________________________________▲△__.
+ (BOOL (^)(NSString *, NSString *))pWriteTextFile;

+ (void (^)(NSString *, NSString *))pAppendTextFile;

+ (NSString *(^)(NSString *))pReadTextFile;

+ (BOOL (^)(NSString *, NSData *))pWriteBinaryFile;

+ (NSData *(^)(NSString *))pReadBinaryFile;

+ (BOOL (^)(NSString *))pMakeFolder;

+ (BOOL (^)(NSString *))pRemoveFolder;

+ (NSArray<NSString *> *(^)(NSString *))pContentsOfDirectory;

+ (BOOL(^)(NSString *, NSString *))pCopy;

+ (BOOL(^)(NSString *, NSString *))pMove;

+ (NSString *)stringToHexCodeText:(NSString *)text;

+ (NSString *)hexCodeToString:(unsigned char *)charCode;
//____________________________________________________________________________________▲△__.
//____________________________________________________________________________________▲△__.
//____________________________________________________________________________________▲△__.


#if DEBUG
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

+ (NSDictionary *(^)(id))getAllKeyAndValues;

+ (NSArray<NSString *> *(^)(id))getAllMethodNamesWithObj;

+ (NSArray<NSString *> *(^)(Class))getAllMethodNamesWithClass;

#pragma clang diagnostic pop
#endif


@end

NS_ASSUME_NONNULL_END
