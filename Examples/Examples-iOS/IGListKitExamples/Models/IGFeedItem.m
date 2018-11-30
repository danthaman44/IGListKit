//
//  IGFeedItem.m
//  IGListKitExamples
//
//  Created by Dan Deng on 11/26/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

#import "IGFeedItem.h"

@implementation IGFeedItem

- (instancetype)initWithPerson:(PersonModel *)person post:(Post *)post {
    if (self == [super init]) {
        _person = [person copy];
        _post = [post copy];
    }
    return self;
}

#pragma mark - IGListDiffable

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
