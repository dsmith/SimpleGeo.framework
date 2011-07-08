//
//  SGPlacesQuery.m
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

#import "SGPlacesQuery.h"

@implementation SGPlacesQuery

- (NSString *)searchQuery
{
    return [self.query objectForKey:@"searchQuery"];
}

- (void)setSearchQuery:(NSString *)searchQuery
{
    [self.query setObject:[searchQuery retain] forKey:@"searchQuery"];
}

- (NSArray *)categories
{
    return [self.query objectForKey:@"categories"];
}

- (void)setCategories:(NSArray *)categories
{
    NSMutableArray *catArray = [NSMutableArray array];
    for (NSObject *object in categories) {
        if ([object isKindOfClass:[NSString class]]) {
            [catArray addObject:object];
        }
    }
    [self.query setObject:catArray forKey:@"categories"];
}

- (void)addCategory:(NSString *)category
{
    if ([self.query objectForKey:@"categories"]) {
        [[self.query objectForKey:@"categories"] addObject:[category retain]];
    } else {
        [self.query setObject:[NSMutableArray arrayWithObject:[category retain]] forKey:@"categories"];
    }
}

@end
