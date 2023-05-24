//
//  ViewController.m
//  My App
//

/*
 TODO: This would be a table view, where you can enter a new band name.
 TODO: Separate view controller that handles entering new data.
 */

#import "ViewController.h"
#import "MyAppListener.h"
#import "MyClass.h"

// Once another protocol is added to an interface
@interface ViewController () <MyAppListener> // IMPLEMENTS MyAppListener

@end

// Imeplementation is the implementation of a class
@implementation ViewController {
    // Define only, no declaration
    // Underscore prefix for private instace/variables/methods
    BOOL _isBoolean;
    NSInteger _clickCounter;
    UILabel* displayButtonText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // To initialize, you have to allocate memory, then initialize.
    // This creats an instance of MyClass, then initializes it.
    MyClass* Class = [[MyClass alloc] initWithMyAppListener:self];
    _clickCounter = 0;
    
      // Create the width, height and X and Y variables.
//    CGFloat btnW = 200;
//    CGFloat btnH = 100;
//    CGFloat rectX = (self.view.frame.size.width - btnW) / 2;
//    CGFloat rectY = (self.view.frame.size.height - btnH) / 2;
//    // Creating a UIButton button using frames
//    // Make the rectangle
//    CGRect rect = CGRectMake(rectX, rectY, btnW, btnH);
//    // Allocate the size of the button
//    UIButton* SaveData = [[UIButton alloc] initWithFrame:rect];
//    // Give the button a background color
//    SaveData.backgroundColor = [UIColor greenColor];
//    // Call the button to the screen
//    [self.view addSubview:SaveData];
    
    /* START BUTTON*/
    
    // Creating a UIButton using constraints
    // Allocate the size of the button
    UIButton* SaveData = [[UIButton alloc] initWithFrame:CGRectZero];
    // Give the button a background color
    SaveData.backgroundColor = [UIColor greenColor];
    SaveData.translatesAutoresizingMaskIntoConstraints = NO;
    // Call the button to the screen
    
    [self.view addSubview:SaveData];
    
    // Use auto contraints to set the button up, @[] is an inline array
    [NSLayoutConstraint activateConstraints:@[
        [SaveData.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [SaveData.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [SaveData.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.4],
        [SaveData.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:.2]
    ]];
    
    // Setting the button title
    [SaveData setTitle:@"Click me!" forState:UIControlStateNormal];
    // Handling the button tap
    [SaveData addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    /* END BUTTON */
    
    /* START LABEL */
    // Adding a label to show button count
    displayButtonText = [[UILabel alloc] initWithFrame:CGRectZero];
    displayButtonText.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Style the button
    displayButtonText.backgroundColor = [UIColor redColor];
    [displayButtonText setTextColor:[UIColor whiteColor]];
    [displayButtonText setText:@"0"];
    
    // Adding label to main view
    [self.view addSubview:displayButtonText];
    // Constrain the label position
    [NSLayoutConstraint activateConstraints:@[
        [displayButtonText.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [displayButtonText.bottomAnchor constraintEqualToAnchor:SaveData.topAnchor constant: -100],
        [displayButtonText.widthAnchor constraintEqualToConstant:150],
        [displayButtonText.heightAnchor constraintEqualToConstant:100]
    ]];
    /* END LABEL */
}

// Defining & implementing the function from MyAppListener
- (void)timeToCompletion:(int)time shouldContinue:(BOOL)keepGoing {
    _isBoolean = keepGoing;
    NSLog(@"Time: %d, Continue: %d", time, keepGoing);
}

- (void)buttonClicked:(UIButton*)saveDataButton {
    _clickCounter += 1;
    NSString* text = [NSString stringWithFormat:@"%ld", _clickCounter];
    [displayButtonText setText:text];
}
@end
