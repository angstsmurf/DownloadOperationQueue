//
//  AppDelegate.h
//  DownloadOperationQueue
//
//  Created by Administrator on 2021-10-21.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property NSOperationQueue *queue;

- (IBAction)cancel:(id)sender;

@end

