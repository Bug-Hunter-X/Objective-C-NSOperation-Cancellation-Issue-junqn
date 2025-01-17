```objectivec
// Correct handling - operation canceled when no longer needed
NSOperationQueue *queue = [[NSOperationQueue alloc] init];
NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{    
    // Check for cancellation before performing the task
    if ([operation isCancelled]) {
        return;
    }
    // Perform long-running task...
}];
[queue addOperation:operation];
// ... later, cancel the operation
[operation cancel];
//Further Improvement: Add a KVO observer to monitor operation's isCancelled status to handle cancellation more gracefully.

//Example of KVO observer:
[operation addObserver:self forKeyPath:@"isCancelled" options:NSKeyValueObservingOptionNew context:nil];

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"isCancelled"]) {
        if ([operation isCancelled]) {
            // Handle cancellation gracefully
            NSLog(@"Operation cancelled");
        }
    }
}

//remove observer when no longer needed
[operation removeObserver:self forKeyPath:@"isCancelled"];
```