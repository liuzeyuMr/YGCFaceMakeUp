//
//  UIBezierPath+SmoothPath.h
//  YGCFaceMarkup
//
//  Created by Qilong Zang on 07/03/2018.
//  Copyright © 2018 Qilong Zang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (SmoothPath)

+ (UIBezierPath *)smoothCurveWithPoints:(NSArray *)points;

@end
