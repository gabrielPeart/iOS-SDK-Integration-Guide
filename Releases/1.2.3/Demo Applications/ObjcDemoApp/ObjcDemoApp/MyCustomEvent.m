//
//  MyCustomEvent.m
//  ObjcDemoApp


#import "MyCustomEvent.h"

@implementation MyCustomEvent

@synthesize name;

@synthesize parameters;

- (instancetype) initWithName:(NSString*) name andParameters:(NSDictionary*) parameters {

        if ((self = [super init])) {
            name = name;
            parameters = parameters;
        }
        return self;
    }
@end
