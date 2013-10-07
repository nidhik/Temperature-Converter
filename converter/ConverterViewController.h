//
//  ConverterViewController.h
//  converter
//
//  Created by Nidhi Kulkarni on 10/3/13.
//  Copyright (c) 2013 Nidhi Kulkarni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConverterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, retain) IBOutlet UITextField *celsiusTextField;
@property (nonatomic, retain) IBOutlet UILabel *fahrenheitLabel;
@property (nonatomic, retain) IBOutlet UILabel *celsiusLabel;
@property (nonatomic, retain) IBOutlet UIButton *convertButton;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;


@end
