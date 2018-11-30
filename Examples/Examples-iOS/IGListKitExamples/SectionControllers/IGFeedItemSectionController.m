//
//  IGFeedItemSectionController.m
//  IGListKitExamples
//
//  Created by Dan Deng on 11/26/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

#import "IGFeedItemSectionController.h"
#import "IGFeedItem.h"
#import "PersonCell.h"
#import "PhotoCell.h"
#import "InteractiveCell.h"

@implementation IGFeedItemSectionController {
    IGFeedItem *feedItem;
}

#pragma mark Constants

static const CGFloat personCellHeight = 74.0;
static const CGFloat interactiveCellHeight = 64.0;

#pragma mark IGListSectionController

- (NSInteger)numberOfItems {
    return 3;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat collectionViewWidth = self.collectionContext.containerSize.width;
    CGSize size;
    if (index == 0) {
        size = CGSizeMake(collectionViewWidth, personCellHeight);
    } else if (index == 1) {
        size = CGSizeMake(collectionViewWidth, collectionViewWidth);
    } else {
        size = CGSizeMake(collectionViewWidth, interactiveCellHeight);
    }
    return size;
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    if (index == 0) {
        PersonCell *personCell = [self.collectionContext dequeueReusableCellOfClass:PersonCell.class
                                                               forSectionController:self
                                                                            atIndex:index];
        personCell.person = feedItem.person;
        return personCell;
    } else if (index == 1) {
        PhotoCell *photoCell = [self.collectionContext dequeueReusableCellOfClass:PhotoCell.class
                                                             forSectionController:self
                                                                          atIndex:index];
        return photoCell;
    } else if (index == 2) {
        InteractiveCell *interactiveCell = [self.collectionContext dequeueReusableCellOfClass:InteractiveCell.class
                                                                         forSectionController:self
                                                                                      atIndex:index];
        return interactiveCell;
    }
    return [UICollectionViewCell new];
}

- (void)didUpdateToObject:(id)object {
    feedItem = (IGFeedItem *) object;
}

#pragma mark IGListDisplayDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController {
}

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController cell:(UICollectionViewCell *)cell atIndex:(NSInteger)index {
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController {
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController cell:(UICollectionViewCell *)cell atIndex:(NSInteger)index {
}

@end
