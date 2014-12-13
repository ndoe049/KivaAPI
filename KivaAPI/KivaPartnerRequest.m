//
//  KivaPartnerRequest.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/13/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaPartnerRequest.h"

static const NSString *kApiUrlString		= @"http://api.kivaws.org/v1/partners.json";

@implementation KivaPartnerRequest

- (NSURLRequest *)urlRequest {
	return [self listPartnersRequestUrl];
}

#pragma mark - NSURLRequestConstruction methods

- (NSURLRequest *)listPartnersRequestUrl {
	return [NSURLRequest requestWithURL:[NSURL URLWithString:(NSString *)kApiUrlString]];
}

#pragma mark - Requests

+ (instancetype)listPartners {
	return [[KivaPartnerRequest alloc] init];
}

@end
