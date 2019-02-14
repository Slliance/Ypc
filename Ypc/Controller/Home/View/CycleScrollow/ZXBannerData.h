//
//  ZXBannerData.h
//  ZXBannerView
//
//  Created by Xie zexin on 03/15/2018.
//  Copyright (c) 2018 Xie zexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXBannerData : NSObject

@property (nonatomic,copy) NSString* subjectImagePath;
@property (nonatomic,copy) NSString* subjectPosition;
@property (nonatomic,copy) NSString* subjectContent;
@property (nonatomic,copy) NSString* subjectImageId;
@property (nonatomic,copy) NSString* subjectTitle;
@property (nonatomic,copy) NSString* subjectId;
@property (nonatomic,copy) NSString* subjectName;
@property (nonatomic,copy) NSString*subjectTopImagePath;
@property (nonatomic,assign) BOOL subjectIsOpen;
@property (nonatomic,strong) NSArray*subjectProductList;
@property (nonatomic,copy) NSString* subjectTopImageId;


@end
