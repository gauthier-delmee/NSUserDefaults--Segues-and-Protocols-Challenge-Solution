//
//  SignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Gauthier Delmee on 26/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import "SignInViewController.h"
#import "CreateAccountViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UIBarButtonItem class]]){
        if ([segue.destinationViewController isKindOfClass:[CreateAccountViewController class]]) {
            CreateAccountViewController *createAccountViewController = segue.destinationViewController;
            createAccountViewController.delegate = self;
        }
    }
}

- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PASSWORD];
    
    if ([self.usernameTextField.text isEqualToString:username] && [self.passwordTextField.text isEqualToString:password]) {
        [self performSegueWithIdentifier:@"toViewController" sender:sender];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Login failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

#pragma mark - CreateAccountViewControllerDelegate Methods
-(void)didCancel{
    NSLog(@"cancel button in create account view controller was pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCreateAccount{
    NSLog(@"create account button in create account view controller was pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
