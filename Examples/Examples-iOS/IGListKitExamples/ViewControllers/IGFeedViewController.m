//
//  IGFeedViewController.m
//  IGListKitExamples
//
//  Created by Dan Deng on 11/26/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "IGFeedViewController.h"
#import "IGFeedItemSectionController.h"
#import "IGFeedItem.h"

@interface IGFeedViewController () <IGListAdapterDataSource, IGListAdapterDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) IGListAdapter *adapter;
@property (strong, nonatomic) NSArray<IGFeedItem *> *data;

@end

@implementation IGFeedViewController

- (instancetype)init {
    if (self = [super init]) {
        self.collectionView = [[UICollectionView alloc]
                               initWithFrame:CGRectZero
                               collectionViewLayout:[UICollectionViewFlowLayout new]];
        self.adapter = [[IGListAdapter alloc]
                        initWithUpdater:[IGListAdapterUpdater new]
                        viewController:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateData];

    [self.view addSubview:self.collectionView];
    self.adapter.dataSource = self;
    self.adapter.delegate = self;
    self.adapter.collectionView = self.collectionView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (void)generateData {
    NSArray *names = @[@"Dan Deng", @"Mike Smith", @"Tim Jones", @"Lucia Wang"];
    NSMutableArray<IGFeedItem *> *feedItems = [NSMutableArray array];
    for (int i = 0; i < names.count; i++) {
        NSString *fullName = [names objectAtIndex:i];

        //Create person model
        NSArray<NSString *> *splitName = [fullName componentsSeparatedByString:@" "];
        NSString *firstName = [splitName objectAtIndex:0];
        NSString *lastName = [splitName objectAtIndex:1];
        NSString *uniqueId = [NSString stringWithFormat:@"%i", i];
        PersonModel *personModel = [[PersonModel alloc] initWithFirstName:firstName
                                                                 lastName:lastName
                                                                 uniqueId:uniqueId];
        // Create post
        Post *post = [[Post alloc] initWithUsername:fullName comments:[NSArray array]];

        IGFeedItem *feedItem = [[IGFeedItem alloc] initWithPerson:personModel post:post];
        [feedItems addObject:feedItem];
    }
    self.data = feedItems;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>>*)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}

- (IGListSectionController*)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [IGFeedItemSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - IGListAdapterDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplayObject:(id)object atIndex:(NSInteger)index {
    NSLog(@"About to display object at %ld", (long)index);
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingObject:(id)object atIndex:(NSInteger)index {
    NSLog(@"Finished displaying object at %ld", (long)index);
}

@end
