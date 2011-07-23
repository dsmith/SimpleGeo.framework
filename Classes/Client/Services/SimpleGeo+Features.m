//
//  SimpleGeo+Features.m
//  SimpleGeo.framework
//
//  Copyright (c) 2010, SimpleGeo Inc.
//  All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "SimpleGeo+Features.h"
#import "SimpleGeo+Internal.h"

@implementation SimpleGeo (Features)

#pragma mark Feature Request Methods

- (void)getFeatureWithHandle:(NSString *)handle
                        zoom:(NSNumber *)zoom
                    callback:(SGCallback *)callback
{    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:[NSString stringWithFormat:@"%d",[zoom intValue]] forKey:@"zoom"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/features/%@.json",
                     SG_URL_PREFIX, SG_API_VERSION, handle];
    
    [self sendHTTPRequest:@"GET"
                    toURL:url
               withParams:parameters
                 callback:callback];
}

- (void)getAnnotationsForFeature:(NSString *)handle
                        callback:(SGCallback *)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/features/%@/annotations.json",
                     SG_URL_PREFIX, SG_API_VERSION, handle];
    
    [self sendHTTPRequest:@"GET"
                    toURL:url
               withParams:nil
                 callback:callback];
}

- (void)annotateFeature:(NSString *)handle
         withAnnotation:(NSDictionary *)annotation
              isPrivate:(BOOL)isPrivate
               callback:(SGCallback *)callback
{    
    NSMutableDictionary *annotationDict = [NSMutableDictionary dictionaryWithDictionary:annotation];
    if (isPrivate) [annotationDict setValue:[NSNumber numberWithBool:YES] forKey:@"private"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/features/%@/annotations.json",
                     SG_URL_PREFIX, SG_API_VERSION, handle];
    
    [self sendHTTPRequest:@"POST"
                    toURL:url
               withParams:annotationDict
                 callback:callback];
}

- (void)getCategoriesWithCallback:(SGCallback *)callback
{    
    NSString *url = [NSString stringWithFormat:@"%@/%@/features/categories.json",
                     SG_URL_PREFIX, SG_API_VERSION];
    
    [self sendHTTPRequest:@"GET"
                    toURL:url
               withParams:nil
                 callback:callback];
}

@end