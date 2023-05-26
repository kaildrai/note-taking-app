//
//  ViewController.h
//  My App
//

#import <UIKit/UIKit.h>

// TODO: Refactor ViewController to BandTableViewController
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

    @property (nonatomic, strong) NSMutableArray* tableBandNamesArray;
    @property (nonatomic, strong) UITableView* tableView;
@end
