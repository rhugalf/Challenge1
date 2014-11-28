//
//  ViewController.m
//  Challenge1
//
//  Created by Hugo on 11/26/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import "ViewController.h"
#import "PageViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textFielOne;
@property (strong, nonatomic) IBOutlet UINavigationItem *navAnswer;
@property (strong, nonatomic) IBOutlet UITextField *textFieldTwo;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *navItemWeb;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navItemWeb setEnabled:NO];
}

- (IBAction)onButtonCalculatePressed:(id)sender {
    NSLog(@"Button calculate Pressed");
    
    NSString *na = self.textFielOne.text;
    NSString *nb = self.textFieldTwo.text;
    int result = [na intValue] * [nb intValue];
    
    NSLog(@"vale1 %i",result);
    
    self.navAnswer.title = [NSString stringWithFormat:@"%d",result];
    
    if (result%5==0) {
        [self.navItemWeb setEnabled:YES];
    } else {
        [self.navItemWeb setEnabled:NO];
    }
    
    [self.view endEditing:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"PageController"]) {

            PageViewController *pageView = segue.destinationViewController;
    
            pageView.navigationItem.title=self.navAnswer.title;
    }
}

@end