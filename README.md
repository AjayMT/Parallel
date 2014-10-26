
# Parallel
Parallel allows you to perform selectors on a background thread and call callbacks after the selectors have been performed.

Here's an example:

```objc
- (instancetype)init
{
    if (self = [super init])
        Parallel *parallel = [[Parallel alloc] init];

    return self;
}

- (id)doSomethingThatTakesTime
{
    return [something thatTakesTime];
}

- (void)someMethod
{
    [parallel performSelector:@selector(doSomethingThatTakesTime)
                     onTarget:self
                 withCallback:^(id result){
        NSLog(@"done: %@", result);
        [parallel cancel];
    }];

    NSLog(@"doing something that takes time...");
}
```

This program will log "doing something that takes time...done: <some object>".

## How it works
Unlike `-[NSThread detachNewThread...]` and `-[NSObject performSelectorInBackground...]`, Parallel doesn't spawn a new thread every time it performs a selector. Here's how it works:

1. You call `[[Parallel alloc] init]`, which starts a background thread and starts an event loop on that thread. The event loop constantly checks an event queue for new events.

2. You call `-[Parallel performSelector...]` which adds an event to the event queue.

3. The event loop, running on the background thread, processes the new event. The selector associated with the event is performed and the associated callback block is called on the main thread.

4. After you're done performing various selectors, you call `-[Parallel cancel]`, which shuts down the event loop and the background thread.

## Installation
You can take the whole thing and drop it in your project, or you can install it with [CocoaPods](http://cocoapods.org).

## API
### `-[Parallel init]`
Initialize the Parallel object and start a beckground thread & event loop.

### `-[Parallel performSelector:(SEL)sel onTarget:(id) target withCallback:(void (^)(id))callback]`
Add a selector to the event queue. Once all selectors previously added have been performed, this selector (`sel`) is performed on `target` on the background thread. Once this selector has been performed, the callback block (`callback`) is called on the main thread and the next selector (if any) is performed. `callback` is called with one argument: the value returned by `sel`.

### `-[Parallel cancel]`
End the event loop and kill the background thread.

## License
MIT License. See `./LICENSE` for details.
