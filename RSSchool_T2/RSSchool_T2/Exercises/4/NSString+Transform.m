#import "NSString+Transform.h"

@implementation NSString (Transform)  

+ (BOOL)pangrams:(NSString *)string {
    NSArray *alphabet = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    NSSet *alphaSet = [[[NSSet alloc] initWithArray:alphabet] autorelease];
    string = [[string stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];
    NSMutableArray *myArray = [NSMutableArray array];
    
    for (int i = 0; i < [string length]; i += 1) {
        NSString *str = [string substringWithRange: NSMakeRange(i, 1)];
        [myArray setObject: str atIndexedSubscript: i];
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (id obj in myArray) {
        
        if (![arr containsObject:obj]) {
            [arr addObject:obj];
        }
    }
    NSArray *sortedArray = [arr sortedArrayUsingSelector: @selector (localizedCaseInsensitiveCompare:)];
    NSCountedSet *set = [[[NSCountedSet alloc]initWithArray:sortedArray] autorelease];
    
    if ([alphaSet isSubsetOfSet:set]) {
        
        return YES;
    }
    
    return NO;
}

+ (int)countVowels:(NSString*)word orConsonats:(BOOL)ok{
    int count = 0;
    int count2 = 0;
    for (int i = 0; i < word.length; i++)
    {
        char ch = [word characterAtIndex:i];
        if (ch == 'a' || ch == 'e' || ch == 'i' ||
            ch == 'u' || ch == 'y' || ch == 'o' ||
            ch == 'A' || ch == 'E' || ch == 'I' ||
            ch == 'U' || ch == 'Y' || ch == 'O')
            count++;
        else
        {
            NSCharacterSet *consonantSet = [NSCharacterSet characterSetWithCharactersInString:@"bcdfghjklmnpqrstvwxzBCDFGHJKLMN PQRSTVWXZ"];
            if ([consonantSet characterIsMember:ch])
                count2++;
        }
    }
    if (ok == YES)
        return count2;
    return count;
}

- (NSString*)transform {
    
    self = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([self isEqual: @""])
        return @"";

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"  +" options:NSRegularExpressionCaseInsensitive error:nil];
    self = [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@" "];
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSMutableArray *numbersVow = [NSMutableArray array];
    
    if ([NSString pangrams:self])
    {
        for (NSString *str in words)
        {
            NSMutableString *str2 = str.mutableCopy;
            int number = [NSString countVowels: str orConsonats:NO];
            [str2 insertString:@(number).stringValue atIndex:0];
            str2 = [NSString capitalizeVowels:str2 orConstonanst:NO].mutableCopy;
            [numbersVow addObject: str2.copy];
        }
        
    } else {
        
        for (NSString *str in words)
        {
            NSMutableString *str2 = str.mutableCopy;
            int number = [NSString countVowels: str orConsonats:YES];
            [str2 insertString:@(number).stringValue atIndex:0];
            str2 = [NSString capitalizeVowels:str2 orConstonanst:YES].mutableCopy;
            [numbersVow addObject: str2.copy];
            
        }
    }
    NSArray *array = numbersVow.copy;
    NSArray *sortedStrings = [array sortedArrayUsingComparator:^NSComparisonResult(NSString *firstString, NSString *secondString) {
        return [[firstString substringToIndex:1] compare:[secondString substringToIndex:1]];
    }];
    array = sortedStrings;
    NSLog(@"%@",array);
    NSString *ss = [array componentsJoinedByString:@" "];
  
    return ss;
}

+ (NSString*)capitalizeVowels:(NSString*)word orConstonanst:(BOOL)ok {
    
    NSMutableArray *array = [NSMutableArray array];
    
    if (ok == NO) {
        for (int i = 0; i < word.length; i++) {
            NSString *ch = [word substringWithRange:NSMakeRange(i, 1)];
            if ([ch  isEqual: @"a"] || [ch  isEqual: @"e"] || [ch  isEqual: @"i"] ||
                [ch  isEqual: @"u"] || [ch  isEqual: @"y"] || [ch  isEqual: @"o"]) {
                ch = ch.uppercaseString;
            }
            [array addObject:ch];
        }
    } else {
        NSString *cons = @"bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ";
        
        for (int i = 0; i < word.length; i++) {
            NSString *con = [word substringWithRange:NSMakeRange(i, 1)];
            if ([cons containsString:con])
            {
                con = con.uppercaseString;
            }
            [array addObject:con];
        }
            
    }
    
    word = [array componentsJoinedByString:@""];
    
    return word;
}

@end



