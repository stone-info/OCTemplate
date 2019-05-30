https://github.com/bendytree/Objective-C-RegEx-Categories#gettingstarted-swift

```objectivec
//Create an NSRegularExpression
Rx* rx = RX(@"\\d");
Rx* rx = [Rx rx:@"\\d"];
Rx* rx = [Rx rx:@"\\d" ignoreCase:YES];

//Test if a string matches
BOOL isMatch = [@"2345" isMatch:RX(@"^\\d+$")];

//Get first match
NSString* age = [@"My dog is 3." firstMatch:RX(@"\\d+")];

//Get matches as a string array
NSArray* words = [@"Hey pal" matches:RX(@"\\w+")];
// words => @[ @"Hey", @"pal" ]

//Get first match with details
RxMatch* match = [@"12.34, 56.78" firstMatchWithDetails:RX(@"\\d+([.]\\d+)")];
// match.value => @"12.34"
// match.range => NSRangeMake(0, 5);
// match.original => @"12.34, 56.78";
// match.groups => @[ RxMatchGroup, RxMatchGroup ];

//Replace with a template string
NSString* result = [@"My dog is 12." replace:RX(@"\\d+") with:@"old"];
// result => @"My dog is old."

//Replace with a block
NSString* result = [RX(@"\\w+") replace:@"hi bud" withBlock:^(NSString* match){
  return [NSString stringWithFormat:@"%i", match.length];
}];
// result => @"2 3"

//Replace with a block that has the match details
NSString* result = [RX(@"\\w+") replace:@"hi bud" withDetailsBlock:^(RxMatch* match){
  return [NSString stringWithFormat:@"%i", match.value.length];
}];
// result => @"2 3"

```