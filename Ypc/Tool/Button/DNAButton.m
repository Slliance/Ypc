//
//  DNAButton.m
//  DnaerApp
//
//  Created by 燕来秋 on 2019/1/22.
//  Copyright © 2019 燕来秋. All rights reserved.
//

#import "DNAButton.h"

@interface DNAButton ()

@property (nonatomic, strong) NSMutableDictionary *bgColorDict;

@end

@implementation DNAButton

- (void)dealloc {
    if (self.bgColorDict) {
        [self.bgColorDict removeAllObjects];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}

- (void)initData {
    _bgColorDict = [[NSMutableDictionary alloc] init];
}

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    if (color) {
        [self.bgColorDict setObject:color forKey:@(state)];
    }else {
        [self.bgColorDict removeObjectForKey:@(state)];
    }
    if (state == UIControlStateNormal) {
        [self setBackgroundColor:color];
    }
}

- (UIColor *)colorWithState:(UIControlState)state {
    UIColor *color = self.bgColorDict[@(state)];
    return color;
}

- (void)setHighlighted:(BOOL)highlighted {
    if (highlighted) {
        [self setBackgroundColor:[self colorWithState:UIControlStateHighlighted]];
    }else {
        if (self.selected == NO) {
            [self setBackgroundColor:[self colorWithState:UIControlStateNormal]];
        }
    }
    
    [super setHighlighted:highlighted];
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        [self setBackgroundColor:[self colorWithState:UIControlStateSelected]];
    }else {
        [self setBackgroundColor:[self colorWithState:UIControlStateNormal]];
    }
    [super setSelected:selected];
}

@end
