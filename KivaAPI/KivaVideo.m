//
//  KivaVideo.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/8/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "KivaVideo.h"

static const NSString *kVideoId		= @"id";
static const NSString *kYoutubeId	= @"youtube_id";

@implementation KivaVideo

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_videoId = [NSNumber numberWithLong:[[dictionary objectForKey:kVideoId] longValue]];
		_youtubeId = [dictionary objectForKey:kYoutubeId];
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"KivaVideo[videoId = %d, youtubeId = %@]",
			[_videoId intValue],
			_youtubeId];
}

@end
