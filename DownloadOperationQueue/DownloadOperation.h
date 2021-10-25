//
//  DownloadOperation.h
//  DownloadOperationQueue
//
//  Created by Administrator on 2021-10-21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DownloadOperation : NSOperation

- (instancetype)initWithSession:(NSURLSession *)session downloadTaskURL:(NSURL *)downloadTaskURL completionHandler:(nullable void (^)(NSURL * _Nullable,  NSURLResponse * _Nullable,  NSError * _Nullable))completionHandler;

@end

NS_ASSUME_NONNULL_END
