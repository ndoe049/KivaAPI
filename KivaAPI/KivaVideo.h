//
//  KivaVideo.h
//  KivaAPI
//
//  Created by Nathan Doe on 12/8/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KivaVideo : NSObject

@property (nonatomic, readonly) NSNumber *videoId;

//	Videos don't have templates. Instead we refer you to the YouTube API (https://developers.google.com/youtube/?csw=1)
//	for information on how to embed, present, or otherwise handle video in your application.
//	Currently all video at Kiva is hosted by YouTube.
@property (nonatomic, readonly) NSString *youtubeId;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
