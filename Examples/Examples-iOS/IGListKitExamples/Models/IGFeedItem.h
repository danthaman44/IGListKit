//
//  IGFeedItem.h
//  IGListKitExamples
//
//  Created by Dan Deng on 11/26/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>
#import "Post.h"
#import "PersonModel.h"

@interface IGFeedItem : NSObject <IGListDiffable>

@property (nonatomic, strong, readonly) PersonModel *person;
@property (nonatomic, strong, readonly) Post *post;

- (instancetype)initWithPerson:(PersonModel *)person
                          post:(Post*)post NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
