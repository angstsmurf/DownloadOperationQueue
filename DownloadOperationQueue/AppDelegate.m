//
//  AppDelegate.m
//  DownloadOperationQueue
//
//  Created by Administrator on 2021-10-21.
//

#import "AppDelegate.h"
#import "DownloadOperation.h"


@interface AppDelegate () 

@end

@implementation AppDelegate

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    _queue = [NSOperationQueue new];
    _queue.maxConcurrentOperationCount = 1;

    NSArray<NSURL *> *urls = @[
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"],
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"],
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"],
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"],
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"],
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"],
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"],
        [NSURL URLWithString: @"https://ifdb.org/showimage?id=1%3A952"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1324"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=0%3A1100"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=1%3A1325"],
        [NSURL URLWithString:@"https://ifdb.org/showimage?id=2%3A378"]
    ];

    for (NSURL *url in urls) {
        DownloadOperation *operation = [[DownloadOperation alloc] initWithSession:[NSURLSession sharedSession] downloadTaskURL:url completionHandler:^(NSURL * localURL, NSURLResponse * response, NSError * error) {
            NSLog(@"finished downloading %@", url.absoluteString);
        }];

        [_queue addOperation:operation];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction)cancel:(id)sender {
    NSLog(@"Cancel!");
    [_queue cancelAllOperations];
}


@end
