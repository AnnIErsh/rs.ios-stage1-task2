#import <Foundation/Foundation.h>

@interface NSString (Transform)

- (NSString*)transform;
+ (BOOL)pangrams:(NSString *)string;
+ (int)countVowels:(NSString*)word orConsonats:(BOOL)ok;
+ (NSString*)capitalizeVowels:(NSString*)word orConstonanst:(BOOL)ok;

@end

