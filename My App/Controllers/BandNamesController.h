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

@interface BandNamesController : UIViewController
@property (nonatomic, copy) AddItemCompletionBlock completionBlock;
@property (nonatomic, strong) UITextField* bandInput;
@property (nonatomic, strong) UIButton* saveBandButton;
@end

NS_ASSUME_NONNULL_END
