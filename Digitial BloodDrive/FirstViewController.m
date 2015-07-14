//
//  FirstViewController.m
//  Digitial BloodDrive
//
//  Created by Rohan Sinha on 27/06/15.
//  Copyright (c) 2015 Rohan Sinha. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
{
	NSArray *bloodGroups;
}

@synthesize bloodGroupPicker;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	bloodGroups = [[NSArray alloc] initWithObjects:@"A+", @"A-", @"B+", @"B-", @"O+", @"O-", @"AB+", @"AB-", nil];
	
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [bloodGroups count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [bloodGroups objectAtIndex:row];
}

@end
