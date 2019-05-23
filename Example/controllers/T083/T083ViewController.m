//
//  T083ViewController.m
//  objc_template
//
//  Created by stone on 2019/04/05.
//  Copyright © 2019 stone. All rights reserved.
//

#import <CommonCrypto/CommonCrypto.h>
#import "T083ViewController.h"

// NSString *const kInitVector = @"ffGGtsdfzxCv5568";
NSString *const kInitVector = @"1234567890123456";

// NSString *const DESKey = @"gg356tt8g5h6j9jh";
NSString *const DESKey = @"1234567890123456";

NSString *const source = @"12345";

@interface T083ViewController ()

@end

@implementation T083ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.

  NSString *key = @"1234567890123456";
  NSString *iv = @"1234567890123456";
  NSString *source = @"你好吗";

  //String -> Data
  NSData *sourceData = [source dataUsingEncoding:NSUTF8StringEncoding];
  // Data -> AESEncrypt
  NSData *ansix923Data = [sourceData cc_encryptUsingAlgorithm:CcCryptoAlgorithmDES key:key InitializationVector:iv Mode:CcCryptorCBCMode Padding:CcCryptorANSIX923];
  NSString *ansix923String = [ansix923Data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
  NSLog(@"%@",ansix923String);

  // Data -> AESDecrypt
  NSData *decryptAnsix923Data = [ansix923Data cc_decryptUsingAlgorithm:CcCryptoAlgorithmDES key:key InitializationVector:iv Mode:CcCryptorCBCMode Padding:CcCryptorANSIX923];
  NSString *decryptString = [[NSString alloc] initWithData:decryptAnsix923Data  encoding:NSUTF8StringEncoding];
  NSLog(@"%@",decryptString);
}

- (void)demo1 {
  NSString *string = [self.class encodeDesWithString:@"hello world"];

  NSLog(@"string = %@", string);

  NSString *withString = [self.class decodeDesWithString:@"Vvxf7+b41GFpcMpQlhvZLw=="];

  NSLog(@"withString = %@", withString);
}

+ (NSString *)encodeDesWithString:(NSString *)str {
  NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];

  size_t plainTextBufferSize = [data length];

  const void *vplainText = (const void *) [data bytes];

  CCCryptorStatus ccStatus;

  uint8_t *bufferPtr = NULL;

  size_t bufferPtrSize = 0;

  size_t movedBytes = 0;

  bufferPtrSize = (plainTextBufferSize + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);

  bufferPtr = malloc(bufferPtrSize * sizeof(uint8_t));

  memset((void *) bufferPtr, 0x0, bufferPtrSize);

  const void *vkey = (const void *) [DESKey UTF8String];

  const void *vinitVec = (const void *) [kInitVector UTF8String];

  ccStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES, kCCOptionPKCS7Padding, vkey, kCCKeySizeDES, vinitVec, vplainText, plainTextBufferSize, (void *) bufferPtr, bufferPtrSize, &movedBytes);

  NSData *myData = [NSData dataWithBytes:(const void *) bufferPtr length:(NSUInteger) movedBytes];

  NSString *result = [myData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

  return result;
}

+ (NSString *)decodeDesWithString:(NSString *)str {
  NSData *encryptData = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];

  size_t plainTextBufferSize = [encryptData length];

  const void *vplainText = [encryptData bytes];

  CCCryptorStatus ccStatus;

  uint8_t *bufferPtr = NULL;

  size_t bufferPtrSize = 0;

  size_t movedBytes = 0;

  bufferPtrSize = (plainTextBufferSize + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);

  bufferPtr = malloc(bufferPtrSize * sizeof(uint8_t));

  memset((void *) bufferPtr, 0x0, bufferPtrSize);

  const void *vkey = (const void *) [DESKey UTF8String];

  const void *vinitVec = (const void *) [kInitVector UTF8String];

  ccStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES, kCCOptionPKCS7Padding, vkey, kCCKeySizeDES, vinitVec, vplainText, plainTextBufferSize, (void *) bufferPtr, bufferPtrSize, &movedBytes);

  NSString *result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *) bufferPtr length:(NSUInteger) movedBytes] encoding:NSUTF8StringEncoding];

  return result;
}


@end
    