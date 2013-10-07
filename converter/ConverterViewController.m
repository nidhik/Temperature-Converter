//
//  ConverterViewController.m
//  converter
//
//  Created by Nidhi Kulkarni on 10/3/13.
//  Copyright (c) 2013 Nidhi Kulkarni. All rights reserved.
//

#import "ConverterViewController.h"

@interface ConverterViewController ()

@property (nonatomic, assign) double fTemp;
@property (nonatomic, assign) double cTemp;
@property (nonatomic, assign) NSString* conversionType;
@property (nonatomic, assign) BOOL convertToCelsius;

- (void) updateVals;
- (void) onConvertButtonPress;


@end

@implementation ConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
    self.fahrenheitTextField.delegate = self;
    self.celsiusTextField.delegate = self;
    
    [self.convertButton addTarget:self action:@selector(onConvertButtonPress) forControlEvents:(UIControlEventTouchDown)];
    
    [self updateVals];
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateVals {
    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%f", self.fTemp];
    self.celsiusTextField.text = [NSString stringWithFormat:@"%f", self.cTemp];
}

- (void) onConvertButtonPress {
    if (self.convertToCelsius) {
        self.fTemp = [self.fahrenheitTextField.text doubleValue];
        self.cTemp = (self.fTemp - 32)*(5.0/9);

    } else {
        self.cTemp = [self.celsiusTextField.text doubleValue];
        self.fTemp = self.cTemp*1.8 + 32;
    }
    [self updateVals];
}

- (void) onDoneButton {
    self.navigationItem.rightBarButtonItem = nil;
    [self.view endEditing:YES];
}


- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {

    if (textField == self.fahrenheitTextField) {
        self.convertToCelsius = true;
        
    } else if (textField == self.celsiusTextField) {
        self.convertToCelsius = false;
    }
    
    return YES;
}

@end
