//
//  BandNamesController.h
//  My App
//
//  Created by Masters Team on 25/05/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^AddItemCompletionBlock)(NSString *newItem);

@protocol BandNamesControllerDelegate <NSObject>

- (void)bandNameControllerDidSaveItem:(NSString *)item;

@end

@interface BandNamesController : UIViewController

    @property (nonatomic, weak) id<BandNamesControllerDelegate> delegate;

    @property (nonatomic, strong) UITextField* bandInput;

    @property (nonatomic, strong) UIButton* saveBandButton;
@property (nonatomic, strong) UIBarButtonItem* goBackButton;


@end

NS_ASSUME_NONNULL_END
