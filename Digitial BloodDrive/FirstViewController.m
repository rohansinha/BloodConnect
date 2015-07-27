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
	NSString *selectedBloodGroup;
}

@synthesize userEmailTF, userFirstNameTF, userLastNameTF, userPhoneTF, userStatusSwitch, delegate;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	bloodGroups = [[NSArray alloc] initWithObjects:@"A+", @"A-", @"B+", @"B-", @"O+", @"O-", @"AB+", @"AB-", nil];
	[userStatusSwitch addTarget:self action:@selector(dismissKeyboard) forControlEvents:UIControlEventEditingDidEndOnExit];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [bloodGroups count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return bloodGroups[row];
}

#pragma mark - PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	selectedBloodGroup = bloodGroups[row];
}

- (IBAction)send:(id)sender {
	//[self dismissModalViewControllerAnimated:YES];
	/*if([self validate]) {
		[self applyChanges];
		[self dismissViewControllerAnimated:YES completion:NO];
	} else {
		UIAlertView *fail = [[UIAlertView alloc] initWithTitle:@"Error"
													   message:@"Please provide valid/realistic input."
													  delegate:nil
											 cancelButtonTitle:@"OK"
											 otherButtonTitles:nil];
		[fail show];
	}*/
	NSDictionary *userDetails = @{@"name":@{@"first":[userFirstNameTF text],@"last":[userLastNameTF text]},@"email":[userEmailTF text],@"contact":[userPhoneTF text],@"bloodGroup":selectedBloodGroup,@"status":[NSNumber numberWithBool:[userStatusSwitch isOn]],@"gps":@{@"lat":@"191.251", @"long":@"87.536"}};
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://127.0.0.1:8080/response"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
	
	
	NSError *error;
	NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDetails options:NSJSONWritingPrettyPrinted error:&error];
	NSString *jsonString = [[NSString alloc] init];
	if (! jsonData) {
		NSLog(@"Got an error: %@", error);
	} else {
		jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
	}
	
	NSData *requestBodyData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
	request.HTTPBody = requestBodyData;
	NSLog(@"%@",jsonString);
	
	
	NSURLConnection *post = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[post start];
	return;
}

- (void)dismissKeyboard:(id)sender {
	[sender resignFirstResponder];
}

@end
