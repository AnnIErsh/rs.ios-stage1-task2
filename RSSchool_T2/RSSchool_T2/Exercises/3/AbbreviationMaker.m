#import "AbbreviationMaker.h"

@interface NSArray(Array)
+ (NSArray*)splitStringIntoArray:(NSString*)string;
@end

@implementation NSArray(Array)
+ (NSArray*)splitStringIntoArray:(NSString*)string;
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < string.length; i++) {
        NSString *ch = [string substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
    }
    return array;
}
@end

@implementation AbbreviationMaker

-(void)dealloc
{
    [_str release];
    [super dealloc];
}
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    if (!_str)
    {
        _str = [a.uppercaseString mutableCopy];
    }
    
    if ([self.str containsString:b]) {
        return @"YES";
    } else {
        
        NSMutableArray *arrayA = [NSArray splitStringIntoArray:a.lowercaseString].mutableCopy;
        NSArray *arrayB = [NSArray splitStringIntoArray:b.lowercaseString];
        NSMutableArray *arr = [NSArray splitStringIntoArray:a.uppercaseString].mutableCopy;
        
        NSMutableOrderedSet *orderedSet= [[NSMutableOrderedSet new] autorelease];
        
        
        NSSet *set2 = [NSSet setWithArray:arrayA];
        NSSet *set3 = [NSSet setWithArray:[NSArray splitStringIntoArray:b.uppercaseString]];
        NSCountedSet *ss = [[[NSCountedSet alloc]initWithSet:set2] autorelease];
        for (NSString *elementB in arrayB) {
            for (NSString *elementA in arrayA) {
                if ([elementB isEqual: elementA]) {
                    [ss removeObject:elementA];
                    [ss addObject:elementA.uppercaseString];
                    NSRange range = [_str rangeOfString:elementA.uppercaseString];
                    [arr removeObjectsInRange: NSMakeRange(0, range.location)];
                    [orderedSet addObjectsFromArray:arr.copy];
                    if (![orderedSet containsObject:elementA.uppercaseString])
                    {
                        return @"NO";
                    }
                    break;
                } else {
                    [ss removeObject:elementA];
                }
            }
        }
        
        if ([set3 isSubsetOfSet:ss])
        {
            return @"YES";
        }
    }
    
    [self dealloc];
    return @"NO";
}

@end
