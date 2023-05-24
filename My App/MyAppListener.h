//
//  MyAppListener.h
//  My App
//

#ifndef MyAppListener_h
#define MyAppListener_h

// Protocol is like a TypeScript Interface (blueprint for classes to use)
@protocol MyAppListener
// Creating methods for MyAppListener
    // void = return value
    // :(int) = the arguement passed in
- (void) timeToCompletion:(int)time shouldContinue:(BOOL)keepGoing;

@end

#endif /* MyAppListener_h */
