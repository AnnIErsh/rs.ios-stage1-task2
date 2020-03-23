#import "Blocks.h"

@implementation Blocks
 
- (NSArray *)arr{
    return _arr;
}

+ (NSArray*)ckeckElementIn:(NSArray*)myArray withClass:(Class)myClass {
    NSMutableArray *elements = @[].mutableCopy;
    for (id object in myArray) {
        if ([object isKindOfClass:[myClass class]]) {
            [elements addObject:object];
        }
    }
    return elements.copy;
}

-(BlockB)blockB {
    _blockB = ^(Class class) {
        _arr = [Blocks ckeckElementIn: _arr withClass:class];
        
        if (class == [NSNumber class]) {
            self.blockC([self.arr valueForKeyPath:@"@sum.self"]);
            NSLog(@"get sum");
        }
        
        if (class == [NSString class])
        {
            self.blockC([self.arr componentsJoinedByString:@""]);
            NSLog(@"concat");
        }
        
        if (class == [NSDate class])
        {
            [_arr sortedArrayUsingSelector:@selector(compare:)];
            NSDateFormatter *formatter = [[NSDateFormatter new] autorelease];
            [formatter setDateFormat:@"dd.MM.yyyy"];
            self.blockC([formatter stringFromDate: _arr.firstObject]);
            NSLog(@"date");
        }
        NSLog(@"get class");
    };
    return [_blockB copy];
}

-(BlockA)blockA {
    _blockA = ^(NSArray* array) {
        _arr = array;
        NSLog(@"get array to blockA");
    };
    return [_blockA copy];
}

- (void)dealloc {
    NSLog(@"%@ IS DEALLOCATING", self);
    [_blockA release];
    [_blockB release];
    [_blockC release];
    [super dealloc];
}

@end

