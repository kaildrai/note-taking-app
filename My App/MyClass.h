//
//  MyClass.h
//  My App
//

#ifndef MyClass_h
#define MyClass_h

#import <UIKit/UIKit.h>
// Forward declaration:
@protocol MyAppListener;

// MyClass is of type NSObject (Objective C object)
@interface MyClass : NSObject
- (instancetype) initWithMyAppListener:(id<MyAppListener>)myAppListener; // Constructor
@end

#endif /* MyClass_h */
