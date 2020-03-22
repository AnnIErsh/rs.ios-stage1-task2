#import <Foundation/Foundation.h>

@interface AbbreviationMaker : NSObject

@property (nonatomic, retain) NSMutableString* str;
@property (nonatomic, retain) NSCountedSet* aset;
@property (nonatomic, retain) NSCountedSet* bset;

- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b;
@end
