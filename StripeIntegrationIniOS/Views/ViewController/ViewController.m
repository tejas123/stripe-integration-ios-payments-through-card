//
//  ViewController.m
//  StripeIntegrationIniOS
//
//  Created by TheAppGuruz-iOS-103 on 16/11/15.
//  Copyright © 2015 TheAppGuruz. All rights reserved.
//

#import "ViewController.h"
#import "PaymentViewController.h"

@interface ViewController () <PaymentViewControllerDelegate>

@end

@implementation ViewController

#pragma mark - ViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - PaymentViewControllerDelegate Methods
- (void)paymentViewController:(PaymentViewController *)controller didFinish:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:^{
        if (error) {
            [self showDialougeWithTitle:@"Error" andMessage:[error localizedDescription]];
        } else {
            [self showDialougeWithTitle:@"Success" andMessage:@"Payment Successfully Created."];
        }
    }];
}

#pragma mark - IBAction Methods
- (IBAction)btnStripeTapped:(id)sender
{
    PaymentViewController *paymentViewController = [[PaymentViewController alloc] initWithNibName:nil bundle:nil];
    paymentViewController.amount = [NSDecimalNumber decimalNumberWithString:@"1.50"];
    paymentViewController.delegate = self;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:paymentViewController];
    
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - Other Methods
- (void)showDialougeWithTitle:(NSString *)strTitle andMessage:(NSString *)strMessage
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:strTitle message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:action];
    
    [self presentViewController:controller animated:YES completion:nil];
}

@end
