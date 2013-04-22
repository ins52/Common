//
//  Common.m
//  Common
//
//  Created by aignatiev on 04.04.13.
//  Copyright (c) 2013 aignatiev. All rights reserved.
//

#import "Common.h"

@implementation Common

#pragma mark - File system & serialization

+ (NSString*) GetFileSettings: (NSString*) sFileName
{
    //~/Library/Application Support/iPhone Simulator/4.3/Applications/[app GUID]
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:sFileName];
}


#pragma mark - Localizations

+ (NSString*) GetCurrentUserLanguage
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    return [languages objectAtIndex:0];
}

+ (NSString*) GetDefaultLanguage
{
    return @"en";
}


#pragma mark - Selectors

+ (id)Do:(id)object withSelector:(SEL)selector
{
    if(object && [object respondsToSelector:selector]) {
        [object performSelector:selector];
    }
    return nil;
}

+ (id)Do:(id)object withSelector:(SEL)selector andParam:(id)param
{
    if(object && [object respondsToSelector:selector]) {
        [object performSelector:selector withObject:param];
    }
    return nil;
}

+ (id)Do:(id)object withSelector:(SEL)selector andParam:(id)param afterDelay:(NSTimeInterval)delay
{
    if(object && [object respondsToSelector:selector]) {
        [object performSelector:selector withObject:param afterDelay:delay];
    }
    return nil;
}


#pragma mark - Collections

// some globally used header
+ (BOOL) isEmpty:(id)thing
{
    if (thing == nil)
        return YES;
    
    return thing == nil
    || [thing isKindOfClass:[NSNull class]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

+ (id)GetElementByArray:(NSArray*)fromArray andClass:(Class) needClass
{
    if (!fromArray || !fromArray.count)
        return nil;
    
    for(int i=0;i<fromArray.count;i++) {
        id one = [fromArray objectAtIndex:i];
        if ([one isMemberOfClass:needClass])
            return one;
    }
    return nil;
}

+ (id) GetObjectByDict:(NSDictionary*)dict andKey:(NSString*)key
{
    if ([[self class] isEmpty:dict] || ![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    id obj = [dict objectForKey:key];
    if ([Common isEmpty:obj]) {
        return nil;
    }
    return obj;
}

+ (id) GetObjectByDict:(NSDictionary*)dict andKey:(NSString*)key withClass:(Class)needClass
{
    id obj = [[self class] GetObjectByDict:dict andKey:key];
    if ([Common isEmpty:obj] || ![obj isKindOfClass:needClass]) {
        return nil;
    }
    return obj;
}

+ (NSString*) GetStringByDict:(NSDictionary*)dict andKey:(NSString*)key
{
    id obj = [[self class] GetObjectByDict:dict andKey:key];
    if ([Common isEmpty:obj] || ![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    return obj;
}

+ (id) GetObjectByArray:(NSArray*)srcArray andIndex:(NSUInteger)index
{
    if ([[self class] isEmpty:srcArray] || ![srcArray isKindOfClass:[NSArray class]] || (index >= srcArray.count)) {
        return nil;
    }
    
    id obj = [srcArray objectAtIndex:index];
    if ([Common isEmpty:obj]) {
        return nil;
    }
    return obj;
}

+ (void) DeepCopyTo:(NSMutableArray*)toArray fromArray:(NSArray*)fromArray
{
    @synchronized(toArray) {
        [toArray removeAllObjects];
        // deep copy
        NSData *buffer = [NSKeyedArchiver archivedDataWithRootObject:fromArray];
        [toArray addObjectsFromArray:[NSKeyedUnarchiver unarchiveObjectWithData: buffer]];
    }
}

+ (void) DeepCopyTo:(NSMutableDictionary*)toDict fromDict:(NSDictionary*)fromDict
{
    @synchronized(toDict) {
        [toDict removeAllObjects];
        // deep copy
        NSData *buffer = [NSKeyedArchiver archivedDataWithRootObject:fromDict];
        [toDict addEntriesFromDictionary:[NSKeyedUnarchiver unarchiveObjectWithData: buffer]];
    }
}


@end
