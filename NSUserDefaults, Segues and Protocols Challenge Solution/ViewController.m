//
//  ViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Gauthier Delmee on 26/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import "ViewController.h"
#import "CreateAccountViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.labelDisplayUsername.text = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    self.labelDisplayPassword.text = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PASSWORD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
