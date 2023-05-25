//
//  BandNamesController.m
//  My App
//

#import "BandNamesController.h"

@interface BandNamesController ()
@end

@implementation BandNamesController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Create Text Field
    self.bandInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    self.bandInput.borderStyle = UITextBorderStyleRoundedRect;
    self.bandInput.placeholder = @"Enter Band Name";
    [self.view addSubview:self.bandInput];
    
    // Create Save Button
    self.saveBandButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.saveBandButton.frame = CGRectMake(20, 160, 200, 40);
    
    [self.saveBandButton setTitle:@"Save Band" forState:UIControlStateNormal];
    [self.saveBandButton addTarget:self action:@selector(saveButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveBandButton];
}

- (void)saveButtonTapped {
    NSString* newItem = _bandInput.text;
    
    if(self.completionBlock) {
        self.completionBlock(newItem);
    }
}
@end
