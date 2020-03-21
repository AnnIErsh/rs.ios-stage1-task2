#import "Blocks.h"

@implementation Blocks

- (BlockC)blockC {
    _blockC = ^(NSObject* result) {
        result = @"43";
        NSLog(@"get values to blockC");
    };
    return _blockC;
}
-(BlockB)blockB {
    _blockB = ^(Class class) {
        NSLog(@"get class to blockB");
    };
    return _blockB;
}
-(BlockA)blockA {
    _blockA = ^(NSArray* array) {
        NSLog(@"get array to blockA");
    };
    return _blockA;
}

- (void)dealloc {
    NSLog(@"%@ IS DEALLOCATING", self);
    
    [_blockA release];
    [_blockB release];
    [_blockC release];
    [super dealloc];
}

@end

