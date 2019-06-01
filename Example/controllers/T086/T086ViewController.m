//
//  T086ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T086ViewController.h"

@interface T086ViewController ()

@end

@implementation T086ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.

  // NSString *rootPath = @"/Users/stone/Desktop/";
  // NSString *string = pathJoin(rootPath, @"/deskTop/newFolder", @"aa", @"bb");

  NSString *string = self.pReadTextFile(@"/Users/stone/Desktop/date.txt");

  NSLog(@"string = %@", string);
}

- (BOOL (^)(NSString *, NSString *))pWriteTextFile {
  return ^BOOL(NSString *filepath, NSString *content) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createFileAtPath:filepath contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
  };
}

- (NSString *(^)(NSString *))pReadTextFile {

  return ^NSString *(NSString *filepath) {

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSData *readData = [fileManager contentsAtPath:filepath];

    return [NSString.alloc initWithData:readData encoding:NSUTF8StringEncoding];;
  };
}

- (BOOL (^)(NSString *, NSData *))pWriteBinaryFile {
  return ^BOOL(NSString *filepath, NSData *content) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createFileAtPath:filepath contents:content attributes:nil];
  };
}

- (NSData *(^)(NSString *))pReadBinaryFile {

  return ^NSData *(NSString *filepath) {

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSData *readData = [fileManager contentsAtPath:filepath];

    return readData;
  };
}

- (BOOL (^)(NSString *))pMakeFolder {
  return ^BOOL(NSString *filepath) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createDirectoryAtPath:filepath withIntermediateDirectories:YES attributes:nil error:nil];
  };
}

// rm -rf
- (BOOL (^)(NSString *))pRemoveFolder {
  return ^BOOL(NSString *dirPath) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:dirPath error:nil];
  };
}

- (NSArray<NSString *> *(^)(NSString *))pContentsOfDirectory {
  return ^NSArray<NSString *> *(NSString *dirPath) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager contentsOfDirectoryAtPath:dirPath error:nil];
  };
}

- (BOOL(^)(NSString *, NSString *))pCopy {
  return ^BOOL(NSString *srcPath, NSString *dstPath) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager copyItemAtPath:srcPath toPath:dstPath error:nil];
  };
}

- (BOOL(^)(NSString *, NSString *))pMove {
  return ^BOOL(NSString *srcPath, NSString *dstPath) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager moveItemAtPath:srcPath toPath:dstPath error:nil];
  };
}

- (void(^)(NSString *, NSString *))pAppendTextFile {
  return ^void(NSString *filePath, NSString *content) {
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    //将文件光标移动到文件的最后位置
    [fileHandle seekToEndOfFile];
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    //写入数据
    [fileHandle writeData:data];
    //用完之后需要关掉
    [fileHandle closeFile];
  };
}

// - (NSString *)pathJoin:(NSString *)paths, ... NS_REQUIRES_NIL_TERMINATION {
//
//   NSString *resultPath = paths;
//
//   va_list args;
//
//   if (paths) {
//
//     va_start(args, paths);
//
//     NSString *path;
//
//     while ((path = va_arg(args, NSString*))) { resultPath = [resultPath stringByAppendingPathComponent:path]; }
//
//     va_end(args);
//   }
//   return resultPath;
// }

@end
    
    
    