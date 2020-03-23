#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {

    NSNumber *first = @0;
    NSNumber *second = @1;
    
    int a = first.intValue;
    int b = second.intValue;
    int prod = 0;
    
    for (; number.intValue >= prod;)
    {
        prod = a * b;
        if (number.intValue == prod)
            return @[@(a), @(b), @1];
        
        int sum = a + b;
        a = b;
        b = sum;
    }
    [self dealloc];
    return @[@(b - a), @(a), @0];
}


- (void)dealloc
{
    [super dealloc];
}
@end


