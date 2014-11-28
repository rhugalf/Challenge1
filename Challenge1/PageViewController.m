//
//  PageViewController.m
//  Challenge1
//
//  Created by Hugo on 11/27/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController() <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation PageViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //self.navigationItem.title=@"Culeros";
    
    [self loadUrlString:@"http://www.mobilemakers.co"];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
     //[self.activityIndicator startAnimating];
     [UIApplication sharedApplication].  networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
    //[self.activityIndicator hidesWhenStopped];
     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)loadUrlString: (NSString *)urlString{
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    //Displaying page title in pageTitleLabel
    
    [self.webView loadRequest:urlRequest];
    
}
@end
