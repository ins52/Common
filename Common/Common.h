//
//  Common.h
//  Common
//
//  Created by aignatiev on 04.04.13.
//  Copyright (c) 2013 aignatiev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonDefines.h"



@interface Common : NSObject

// File system & serialization
+ (NSString*) GetFileSettings: (NSString*)sFileName;

// localization
+ (NSString*) GetCurrentUserLanguage;
+ (NSString*) GetDefaultLanguage;

// selectors
+ (id)Do:(id)object withSelector:(SEL)selector;
+ (id)Do:(id)object withSelector:(SEL)selector andParam:(id)param;
+ (id)Do:(id)object withSelector:(SEL)selector andParam:(id)param afterDelay:(NSTimeInterval)delay;


// collections
+ (BOOL) isEmpty:(id)thing;
+ (id) GetElementByArray:(NSArray*)fromArray andClass:(Class) needClass;
+ (id) GetObjectByDict:(NSDictionary*)dict andKey:(NSString*)key;
+ (id) GetObjectByDict:(NSDictionary*)dict andKey:(NSString*)key withClass:(Class)needClass;
+ (NSString*) GetStringByDict:(NSDictionary*)dict andKey:(NSString*)key;
+ (id) GetObjectByArray:(NSArray*)srcArray andIndex:(NSUInteger)index;
+ (void) DeepCopyTo:(NSMutableArray*)toArray fromArray:(NSArray*)fromArray;
+ (void) DeepCopyTo:(NSMutableDictionary*)toDict fromDict:(NSDictionary*)fromDict;

@end
