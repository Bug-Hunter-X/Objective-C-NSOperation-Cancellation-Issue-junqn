# Objective-C NSOperation Cancellation Issue

This repository demonstrates a common Objective-C bug related to the improper handling of `NSOperation` and `NSOperationQueue`.  Forgetting to cancel operations when they're no longer needed can lead to resource leaks and unexpected behavior.  The `bug.m` file shows the incorrect implementation, while `bugSolution.m` provides the corrected version.

## Problem
The original code fails to cancel an `NSBlockOperation` when it's no longer needed, potentially resulting in a resource leak if the operation is performing a lengthy or resource-intensive task.

## Solution
The solution involves explicitly canceling the operation using the `cancel` method before the operation is deallocated, ensuring proper resource management and preventing potential leaks.