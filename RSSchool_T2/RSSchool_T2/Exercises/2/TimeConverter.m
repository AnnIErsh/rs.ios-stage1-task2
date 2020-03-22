#import "TimeConverter.h"

@implementation TimeConverter

- (NSString*)setPreposition:(int)minutes {

    switch (minutes) {
        case 0:
            return [NSString stringWithFormat:@"%@ o' clock", self.hour];
        case 1 ... 30:
            return [NSString stringWithFormat:@"past %@", self.hour];
        case 31 ... 59:
            return [NSString stringWithFormat:@"to %@", self.hour];
        default:
            break;
    }
    return @"";
}

- (NSString*)setBegin:(int)minutes andHours:(NSString*)hours {
    
    NSString *str = [[NSString new] autorelease];
    NSString *str2 = [[NSString new] autorelease];
    int j = 0;
    int k = 0;
    
    if (minutes > 30) {
        k = hours.intValue + 1;
        self.hour = [self.dict objectForKey:@(k).stringValue];
    }
    
    switch (minutes) {
        case 32 ... 44:
        case 46 ... 59:
            minutes = 60 - minutes;
            break;
        default:
            break;
    }
    
    switch (minutes) {
        case 1:
            return @"one minute";
        case 2 ... 12:
            str = [self.dict objectForKey:@(minutes).stringValue];
            return [NSString stringWithFormat:@"%@ minutes", str];
        case 13 ... 14:
        case 16 ... 19:
            str = [self.begining objectForKey:@(minutes).stringValue];
            return [NSString stringWithFormat:@"%@teen minutes", str];
        case 20 ... 29:
            j = minutes % 10;
            str = [self.begining objectForKey:@(minutes - j).stringValue];
            str2 = [self.dict objectForKey:@(j).stringValue];
            return [NSString stringWithFormat:@"%@ty %@ minutes", str, str2];
        case 15:
        case 45:
            return @"quarter";
        case 30:
            return @"half";
        default:
            break;
    }
    return @"";
}
- (void)createDictionaryWithNumbers {
    self.dict = @{@"1":@"one",
                  @"2":@"two",
                  @"3":@"three",
                  @"4":@"four",
                  @"5":@"five",
                  @"6":@"six",
                  @"7":@"seven",
                  @"8":@"eight",
                  @"9":@"nine",
                  @"10":@"ten",
                  @"11":@"eleven",
                  @"12":@"twelve",
                  @"00":@"twelve",
    };
    
    self.begining = @{@"13":@"thir",
                      @"14":@"four",
                      @"16":@"six",
                      @"17":@"seven",
                      @"18":@"eigh",
                      @"19":@"nine",
                      @"20":@"twen",
    };
    
    
}
-(void)dealloc{
    [_begining release];
    [_dict release];
    [_hour release];
    [super dealloc];
}
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    if (minutes.intValue > 60 || hours.intValue > 12)
    {
        return @"";
    }
    [self createDictionaryWithNumbers];
    self.hour = [self.dict objectForKey:hours];
    NSString *newstr = [self setBegin:minutes.intValue andHours: hours];
    NSString *combined = [self setPreposition:minutes.intValue];
    if ([newstr  isEqual: @""])
    {
        return combined;
    }
    if ([combined  isEqual: @""])
    {
        return newstr;
    }
    
    NSString *allString =  [NSString stringWithFormat:@"%@ %@", newstr, combined];
    
    NSLog(@"%@", allString);
    [self dealloc];
    return allString;
}
@end
