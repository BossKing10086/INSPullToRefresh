//
//  INSLappsyPullToRefresh.m
//  INSPullToRefresh
//
//  Created by Michał Zaborowski on 22.02.2015.
//  Copyright (c) 2015 inspace.io. All rights reserved.
//

#import "INSLappsyPullToRefresh.h"

@interface INSLappsyPullToRefresh ()
@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation INSLappsyPullToRefresh

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSMutableArray *images = [[NSMutableArray alloc] init];

        for (int i = 0; i < 30; i++) {
            [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"hud_%d",i]]];
        }
        self.images = images;
        self.image = [images firstObject];

        self.animationImages = [[images objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(21, 9)]] arrayByAddingObjectsFromArray:[images objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 20)]]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.center = CGPointMake(CGRectGetMidX(self.superview.bounds), CGRectGetMidY(self.superview.bounds));
}

- (void)handleProgress:(CGFloat)progress forState:(INSPullToRefreshBackgroundViewState)state {
    if (state == INSPullToRefreshBackgroundViewStateTriggered || state == INSPullToRefreshBackgroundViewStateNone) {
        NSInteger frame = (NSInteger)(progress * 20);
        self.image = self.images[frame];
    }

}
- (void)handleStateChange:(INSPullToRefreshBackgroundViewState)state {
    if (state == INSPullToRefreshBackgroundViewStateNone) {
        [self stopAnimating];
    } else if (state == INSPullToRefreshBackgroundViewStateTriggered) {

    } else {
        [self startAnimating];
    }
}

@end
