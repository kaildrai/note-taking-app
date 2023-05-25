//
//  MyClass.m
//  My App
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "MyAppListener.h"

@implementation MyClass {
    // instance variables (underscores for private variables)
    id<MyAppListener> _myAppListener; // set to nil by default
}

// calls the parent initializer (super (NSObject init))
- (instancetype)initWithMyAppListener:(id<MyAppListener>)myAppListener {
    if(self = [super init]) {
        _myAppListener = myAppListener; 
        [self Go]; 
    }
    return self;
}

// Setting private function
- (void)Go {
    [_myAppListener timeToCompletion:20 shouldContinue:YES];
}

@end
