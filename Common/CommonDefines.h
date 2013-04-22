//
//  CommonDefines.h
//  Common
//
//  Created by aignatiev on 04.04.13.
//  Copyright (c) 2013 aignatiev. All rights reserved.
//

#ifndef Common_CommonDefines_h
#define Common_CommonDefines_h

#if __has_feature(objc_arc)
#define CMN_AUTORELEASE(exp) exp
#define CMN_RELEASE(exp) exp
#define CMN_RETAIN(exp) exp
#else
#define CMN_AUTORELEASE(exp) [exp autorelease]
#define CMN_RELEASE(exp) [exp release]
#define CMN_RETAIN(exp) [exp retain]
#endif



// debug log
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"[%p:%d] %s " fmt), self, [NSThread isMainThread], __PRETTY_FUNCTION__,  ##__VA_ARGS__);
#else
#define DLog(fmt, ...)
#endif

// release log
#define RLog(fmt, ...) NSLog((@"[%p] %s " fmt), self, __PRETTY_FUNCTION__,  ##__VA_ARGS__);

#define _PRINT_ID_(whatID)      DLog(@"objClass : %@ (rc=%d)", [[whatID class] description], whatID.retainCount);


#define IS_IPHONE               ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPAD                 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_RETINA_DISPLAY       ([[UIScreen mainScreen] scale] > 1.0)


#define SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define KEY_KEY                         @"key"
#define KEY_VALUE                       @"value"



#endif
