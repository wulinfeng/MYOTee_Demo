//
//  BoxModelViewController.h
//  3DModel
//
//  Created by Linfeng Wu on 14-5-28.
//  Copyright (c) 2014年 Linfeng Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelRecord.h"
#import "JSONKit.h"

@interface BoxModelViewController : UIViewController<UIAlertViewDelegate>

@property NSString *userName;
@property NSString *cat;

@property ModelRecord *record;

@end
