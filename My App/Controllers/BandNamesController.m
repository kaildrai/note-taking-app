//
//  BandNamesController.m
//  My App
//

#import "BandNamesController.h"
#import "BandTableViewController.h"

@implementation BandNamesController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:235 green:235 blue:235 alpha:200];
    self.title = @"New Band";
    
    // Create Text Field
    self.bandInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 40)];
    self.bandInput.borderStyle = UITextBorderStyleRoundedRect;
    self.bandInput.placeholder = @"Enter Band Name";
    self.bandInput.textColor = [UIColor blackColor];
    [self.view addSubview:self.bandInput];
    
    // Create Save Button
    CGFloat btnW = 200;
    CGFloat btnH = 100;
    CGFloat btnX = (self.view.frame.size.width - btnW) / 2;
    CGFloat btnY = (self.view.frame.size.height - btnH) / 2;

    self.saveBandButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.saveBandButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    self.saveBandButton.backgroundColor = [UIColor whiteColor];
    
    self.saveBandButton.layer.cornerRadius  = 5.0;
    self.saveBandButton.layer.borderColor = [[UIColor blackColor] CGColor];
    self.saveBandButton.layer.borderWidth = 1.0;
    
    self.saveBandButton.titleLabel.textColor = [UIColor blackColor];
    
    [self.saveBandButton setTitle:@"Save Band" forState:UIControlStateNormal];
    [self.saveBandButton addTarget:self action:@selector(saveButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveBandButton];
    
    // Back button
    _goBackButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack:)];
        self.navigationItem.leftBarButtonItem = _goBackButton;
    
}

- (void)saveButtonTapped {
    if ([self.bandInput.text isEqualToString:@""])
    {
        return;
    }
    [self.delegate bandNameControllerDidSaveItem:self.bandInput.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)goBack:(id)send {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
