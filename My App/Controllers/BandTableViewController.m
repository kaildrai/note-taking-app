//
//  ViewController.m
//  My App
//

/*
 TODO: This would be a table view, where you can enter a new band name.
 TODO: Separate view controller (modal?) that handles entering new data.
 */

#import "BandTableViewController.h"
#import "BandNamesController.h"

// TODO: Refactor ViewController to BandTableViewController
@interface ViewController () <BandNamesControllerDelegate>

@end

// TODO: Refactor ViewController to BandTableViewController
@implementation ViewController {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Instantiate the array of band names
    self.tableBandNamesArray = [[NSMutableArray alloc] init];
    
    // Create the nav bar
    UINavigationBar* navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 55)];
    [self.view addSubview:navBar];
    navBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILayoutGuide* safeArea = self.view.safeAreaLayoutGuide;
    
    [NSLayoutConstraint activateConstraints:@[
        [navBar.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor],
        [navBar.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor],
        [navBar.topAnchor constraintEqualToAnchor:safeArea.topAnchor],
        [navBar.heightAnchor constraintEqualToConstant:55]
    ]];
    
    // Create a nav item
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Band Names"];
    [navBar setItems:@[navItem]];
    
    // Create the '+' nav button
    UIBarButtonItem* navButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBandNameTapped:)];
    
    navItem.rightBarButtonItem = navButton;
        
    // Create a table view
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

// Nav bar button click
- (void)addBandNameTapped:(id)sender
{
    BandNamesController *addBandVC = [[BandNamesController alloc] init];
   addBandVC.delegate = self;
    
   UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addBandVC];
    
   [self presentViewController:navController animated:YES completion:nil];
}

- (void)bandNameControllerDidSaveItem:(nonnull NSString *)item {
    [self.tableBandNamesArray addObject:item];
    [self.tableView reloadData];
}

/*--- BEGIN TABLE VIEW METHODS ---*/
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.tableBandNamesArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableBandNamesArray.count;
}
/*--- END TABLE VIEW METHODS ---*/

@end
