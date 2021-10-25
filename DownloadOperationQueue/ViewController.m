//
//  ViewController.m
//  DownloadOperationQueue
//
//  Created by Administrator on 2021-10-21.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface HelperView : NSView
@end

@implementation HelperView

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (IBAction)cancel:(id)sender {
    AppDelegate *appDelegate = (AppDelegate*)NSApplication.sharedApplication.delegate;
    [appDelegate cancel:sender];
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



@end
