//
//  T084ViewController.m
//  objc_template
//
//  Created by stone on 2019/3/30.
//  Copyright © 2019 stone. All rights reserved.
//

#import "T084ViewController.h"

@interface T084Person : NSObject
@end

@implementation T084Person
@end

//sn_note:=========  ============================ stone 🐳 ===========/
@interface  T084ViewController ()

@end

@implementation T084ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  Rx* rx = RX(@"\\d");
  // Rx* rx = [Rx rx:@"\\d"];
  // Rx* rx = [Rx rx:@"\\d" ignoreCase:YES];

  //Test if a string matches
  BOOL isMatch = [@"2345" isMatch:RX(@"^\\d+$")];

  NSLog(@"isMatch = %d", isMatch);
}


@end
    
    
    
