#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateComponents *components = [[NSDateComponents new] autorelease];
    [components setDay:day.intValue];
    [components setMonth:month.intValue];
    [components setYear:year.intValue];
    NSCalendar *cal = [NSCalendar currentCalendar];
    components.calendar = cal;
    BOOL isValid = components.isValidDate;
    if (!isValid)
    {
       return @"Такого дня не существует";
    }
    
    NSDate *date = [cal dateFromComponents:components];

    NSDateFormatter *dateFormatter = [[NSDateFormatter new] autorelease];
    [dateFormatter setDateFormat:@"dd MMMM, EEEE"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    
    NSString *weekday = [dateFormatter stringFromDate:date];
    NSLog(@"%@", weekday);
  
    return weekday;
}

@end

