#import <Foundation/Foundation.h>

@interface TimeConverter : NSObject

@property (nonatomic, retain)NSDictionary* dict;
@property (nonatomic, retain)NSDictionary* begining;
@property (nonatomic, retain)NSString* hour;

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes;
- (NSString*)setPreposition:(int)minutes;
- (NSString*)setBegin:(int)minutes andHours:(NSString*)hours;

@end
