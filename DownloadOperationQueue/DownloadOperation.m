//
//  DownloadOperation.m
//  DownloadOperationQueue
//
//  Created by Administrator on 2021-10-21.
//

#import "DownloadOperation.h"

typedef enum OperationState : NSUInteger {
    kReady,
    kExecuting,
    kFinished
} OperationState;

@interface DownloadOperation ()

@property NSURLSessionDownloadTask *task;

@property OperationState state;

@end


@implementation DownloadOperation


// default state is ready (when the operation is created)

@synthesize state = _state;

- (void)setState:(OperationState)state {
    @synchronized(self) {
        if (_state != state) {
            [self willChangeValueForKey:@"isExecuting"];
            [self willChangeValueForKey:@"isFinished"];
            _state = state;
            [self didChangeValueForKey: @"isExecuting"];
            [self didChangeValueForKey: @"isFinished"];
        }
    }
}

- (OperationState)state {
    @synchronized (self) {
        return _state;
    }
}

- (BOOL)isReady { return (self.state == kReady); }
- (BOOL)isExecuting { return (self.state  == kExecuting); }
- (BOOL)isFinished { return (self.state  == kFinished); }

- (BOOL)isAsynchronous {
    return YES;
}

- (instancetype)initWithSession:(NSURLSession *)session downloadTaskURL:(NSURL *)downloadTaskURL completionHandler:(nullable void (^)(NSURL * _Nullable,  NSURLResponse * _Nullable,  NSError * _Nullable))completionHandler {

    self = [super init];

    if (self) {
        __unsafe_unretained DownloadOperation *weakSelf = self;
        // use weak self to prevent retain cycle
        _task = [[NSURLSession sharedSession] downloadTaskWithURL:downloadTaskURL
                                                completionHandler:^(NSURL * _Nullable localURL, NSURLResponse * _Nullable response, NSError * _Nullable error) {

            /*
             if there is a custom completionHandler defined,
             pass the result gotten in downloadTask's completionHandler to the
             custom completionHandler
             */
            if (completionHandler) {
                completionHandler(localURL, response, error);
            }

            /*
             set the operation state to finished once
             the download task is completed or have error
             */
            weakSelf.state = kFinished;
        }];
    }

    return self;
}

- (void)start {
    /*
     if the operation or queue got cancelled even
     before the operation has started, set the
     operation state to finished and return
     */
    if (self.cancelled) {
        self.state = kFinished;
        return;
    }

    // set the state to executing
    self.state = kExecuting;

    NSLog(@"downloading %@", self.task.originalRequest.URL.absoluteString);

    // start the downloading
    [self.task resume];
}

-(void)cancel {
    [super cancel];

    // cancel the downloading
    [self.task cancel];
}

@end
