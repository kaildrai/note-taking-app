//
//  MyClass.m
//  My App
//
//  Created by Masters Team on 24/05/23.
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
        [self Go]; // Calls the Go function
    }
    return self;
}

// Setting private function
- (void)Go {
    [_myAppListener timeToCompletion:20 shouldContinue:YES];
}

@end
