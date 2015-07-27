//
//  FirstViewController.h
//  Digitial BloodDrive
//
//  Created by Rohan Sinha on 27/06/15.
//  Copyright (c) 2015 Rohan Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
	IBOutlet UIPickerView *bloodGroupPicker;
}

@property (weak, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UITextField *userFirstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *userLastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *userEmailTF;
@property (weak, nonatomic) IBOutlet UITextField *userPhoneTF;
@property (weak, nonatomic) IBOutlet UISwitch *userStatusSwitch;

-(IBAction)send:(id)sender;

@end

