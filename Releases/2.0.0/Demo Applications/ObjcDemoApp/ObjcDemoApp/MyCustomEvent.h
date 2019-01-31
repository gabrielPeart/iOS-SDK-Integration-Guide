//
//  MyCustomEvent.h
//  ObjcDemoApp


#ifndef MyCustomEvent_h
#define MyCustomEvent_h

@import OptimoveSDK;

@interface MyCustomEvent : NSObject <OptimoveEvent>
- (instancetype) initWithName:(NSString*) name andParameters:(NSDictionary*) parameters;
@end


#endif /* MyCustomEvent_h */
