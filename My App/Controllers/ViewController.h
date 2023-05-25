//
//  ViewController.h
//  My App
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

    @property (nonatomic, strong) NSMutableArray* tableBandNamesArray;
    @property (nonatomic, strong) UITableView* tableView;
@end
