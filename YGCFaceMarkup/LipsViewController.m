//
//  LipsViewController.m
//  YGCFaceMarkup
//
//  Created by Qilong Zang on 07/03/2018.
//  Copyright © 2018 Qilong Zang. All rights reserved.
//

#import "LipsViewController.h"
#import "UIBezierPath+SmoothPath.h"

@interface LipsViewController ()
{
  NSArray *pointsArray;
  CGSize imageSize;
  UIImageView *backgroundImageView;
  UIImageView *imageView;
  UIColor *lipsColor;
}

@end

@implementation LipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  lipsColor = [UIColor colorWithRed:227.0/255 green:45.0/255 blue:45.0/255 alpha:0.8];
  imageSize = CGSizeMake(1500, 2337);
  NSValue *mouth_left_corner = [NSValue valueWithCGPoint:CGPointMake(633, 1268)];
  NSValue *mouth_upper_lip_left_contour2 = [NSValue valueWithCGPoint:CGPointMake(674, 1254)];
  NSValue *mouth_upper_lip_left_contour1 = [NSValue valueWithCGPoint:CGPointMake(717, 1245)];
  NSValue *mouth_upper_lip_top = [NSValue valueWithCGPoint:CGPointMake(745, 1251)];
  NSValue *mouth_upper_lip_right_contour1 = [NSValue valueWithCGPoint:CGPointMake(774, 1245)];
  NSValue *mouth_upper_lip_right_contour2 = [NSValue valueWithCGPoint:CGPointMake(821, 1255)];
  NSValue *mouth_right_corner = [NSValue valueWithCGPoint:CGPointMake(869, 1268)];
  NSValue *mouth_upper_lip_right_contour3 = [NSValue valueWithCGPoint:CGPointMake(806, 1270)];
  NSValue *mouth_upper_lip_bottom = [NSValue valueWithCGPoint:CGPointMake(746, 1273)];
  NSValue *mouth_upper_lip_left_contour3 = [NSValue valueWithCGPoint:CGPointMake(690, 1269)];

  pointsArray = @[mouth_left_corner, mouth_upper_lip_left_contour2, mouth_upper_lip_left_contour1, mouth_upper_lip_top, mouth_upper_lip_right_contour1, mouth_upper_lip_right_contour2, mouth_right_corner, mouth_upper_lip_right_contour3, mouth_upper_lip_bottom, mouth_upper_lip_left_contour3, mouth_left_corner];

  backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
  backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
  backgroundImageView.image = [UIImage imageNamed:@"wuyanzu.jpeg"];
  [self.view addSubview:backgroundImageView];

  imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
  imageView.contentMode = UIViewContentModeScaleAspectFit;
  imageView.backgroundColor = [UIColor clearColor];
  [self.view addSubview:imageView];
  [self drawImageWithPoints];
}

- (void)drawImageWithPoints {
  UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
  UIGraphicsGetCurrentContext();
 // [UIColor blackColor].setStroke;
  [lipsColor setFill];
  UIBezierPath *path = [UIBezierPath smoothCurveWithPoints:pointsArray];
  [path closePath];
  [path stroke];
  [path fill];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
