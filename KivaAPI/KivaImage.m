//
//  KivaImage.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/8/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaImage.h"

static const NSString *kImageId				= @"id";
static const NSString *kTemplateId			= @"template_id";

static const NSString *kSquare80			= @"w80h80";
static const NSString *kSquare200			= @"w200h200";
static const NSString *kSquare300			= @"s300";
static const NSString *kLandscape325x250	= @"w325xh250";
static const NSString *kLandscape450x360	= @"w450xh360";
static const NSString *kFullsize			= @"fullsize";

static const NSString *kImageApiUrl			= @"http://www.kiva.org/img/%@/%d.jpg";

@implementation KivaImage

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_imageId = [NSNumber numberWithLong:[[dictionary objectForKey:kImageId] longValue]];
		_templateId = [NSNumber numberWithLong:[[dictionary objectForKey:kTemplateId] longValue]];
	}
	
	return self;
}

- (NSString *)urlForImageSize:(ImageSize)size {
	NSString *string = [[NSString stringWithFormat:(NSString *)kImageApiUrl, [self valueForImageSize:size], [_imageId intValue]]
						stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	string = [string stringByReplacingOccurrencesOfString:@"(null)"
											   withString:@""];
	NSLog(@"Request String: %@", string);
	return string;
}

- (NSString *)valueForImageSize:(ImageSize)size {
	switch (size) {
		case SQUARE_80:
			return (NSString *)kSquare80;
			break;
		case SQUARE_200:
			return (NSString *)kSquare200;
			break;
		case SQAURE_300:
			return (NSString *)kSquare300;
			break;
		case LANDSCAPE_325_250:
			return (NSString *)kLandscape325x250;
			break;
		case LANDSCAPE_450_360:
			return (NSString *)kLandscape450x360;
			break;
		default:
			return (NSString *)kFullsize;
			break;
	}
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaImage[imageId = %d, templateId = %d]",
			[_imageId intValue],
			[_templateId intValue]];
}

@end
