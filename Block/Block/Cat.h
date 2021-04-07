//
//  Cat.h
//  Block
//
//  Created by dq on 2021/1/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ShowCatBlock)(void);

@interface Cat : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) ShowCatBlock catBlock;

@end

NS_ASSUME_NONNULL_END
