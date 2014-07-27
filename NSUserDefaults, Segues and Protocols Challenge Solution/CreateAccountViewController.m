//
//  CreateAccountViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Gauthier Delmee on 26/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions

- (IBAction)createAccountButtonPressed:(UIButton *)sender {
    
    
    
    NSLog(@"%@", self.usernameTextField.text);
    if (self.usernameTextField.text.length != 0 && self.passwordTextField.text.length != 0 && self.confirmPasswordTextField.text.length != 0) {
        if (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Password error" message:@"The password and confirm password fields don't match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        } else {
            //this is where the account details are saved in nsuserdefaults
            
            [[NSUserDefaults standardUserDefaults] setObject:self.usernameTextField.text forKey:USER_NAME];
            [[NSUserDefaults standardUserDefaults] setObject:self.passwordTextField.text forKey:USER_PASSWORD];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [self.delegate didCreateAccount];
        }
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Create Account Error" message:@"Please fill in all the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

#pragma mark - Helper Methods
-(NSDictionary *)accountObjectAsPropertyList{
    NSDictionary *dictionary = @{USER_NAME : self.usernameTextField, USER_PASSWORD : self.passwordTextField};
    
    return dictionary;
}

@end
