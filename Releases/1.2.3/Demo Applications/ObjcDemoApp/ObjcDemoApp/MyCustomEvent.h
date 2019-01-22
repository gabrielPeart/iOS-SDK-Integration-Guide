//
//  MyCustomEvent.h
//  ObjcDemoApp

#import <Foundation/Foundation.h>
@import OptimoveSDK;

NS_ASSUME_NONNULL_BEGIN

@interface MyCustomEvent : NSObject<OptimoveEvent>

- (instancetype) initWithName:(NSString*) name andParameters:(NSDictionary*) parameters;
@end

NS_ASSUME_NONNULL_END
