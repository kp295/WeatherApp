//
//  WAWeather.m
//  WeatherApp
//
//  Created by Kenneth Pu on 6/9/14.
//  Copyright (c) 2014 Kenneth Pu. All rights reserved.
//

#import "WAWeather.h"

@implementation WAWeather

/// Initializes a current Weather instance with the required properties
- (id)initWithCondition:(NSString*)condition
                iconUrl:(NSString*)iconUrl
            temperature:(NSString*)temperature
                 hiTemp:(NSString*)hiTemp
                 loTemp:(NSString*)loTemp
                   time:(NSString*)time
{
    self = [super init];
    if (self) {
        _condition = condition;
        _icon = [self imageName:iconUrl];
        _temperature = temperature;
        _hiTemp = hiTemp;
        _loTemp = loTemp;
        _time = time;
    }
    return self;
}

/// Initializes an hourly Weather instance with the required properties
- (id)initWithIconUrl:(NSString*)iconUrl
          temperature:(NSString*)temperature
                 time:(NSString*)time
{
    return [self initWithCondition:nil
                           iconUrl:iconUrl
                       temperature:temperature
                            hiTemp:nil
                            loTemp:nil
                              time:time];
}

/// Initializes a daily Weather instance with the given properties
- (id)initWithIconUrl:(NSString*)iconUrl
               hiTemp:(NSString*)hiTemp
               loTemp:(NSString*)loTemp
                 time:(NSString*)time
{
    return [self initWithCondition:nil
                           iconUrl:iconUrl
                       temperature:nil
                            hiTemp:hiTemp
                            loTemp:loTemp
                              time:time];
}

/// Returns a dictionary to map icon urls returned by weather underground to our own custom icons
+ (NSDictionary*)iconMap {
    static NSDictionary *_iconMap = nil;
    if (!_iconMap) {
        NSString *iconMapPlistPath = [[NSBundle mainBundle] pathForResource:@"iconMap" ofType:@"plist"];
        _iconMap = [NSDictionary dictionaryWithContentsOfFile:iconMapPlistPath];
    }
    return _iconMap;
}

/// Use icon url returned by weather underground to get corresponding art asset
- (NSString*)imageName:(NSString*)iconURL
{
    return [WAWeather iconMap][iconURL];
}

/// Archives an instance of a Weather object
- (void)encodeWithCoder:(NSCoder*)aCoder
{
    [aCoder encodeObject:self.condition forKey:@"condition"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.temperature forKey:@"temperature"];
    [aCoder encodeObject:self.hiTemp forKey:@"hitemp"];
    [aCoder encodeObject:self.loTemp forKey:@"lotemp"];
    [aCoder encodeObject:self.time forKey:@"time"];
}

/// Unarchives an instance of a Weather object
- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super init];
    if (self) {
        _condition = [aDecoder decodeObjectForKey:@"condition"];
        _icon = [aDecoder decodeObjectForKey:@"icon"];
        _temperature = [aDecoder decodeObjectForKey:@"temperature"];
        _hiTemp = [aDecoder decodeObjectForKey:@"hitemp"];
        _loTemp = [aDecoder decodeObjectForKey:@"lotemp"];
        _time = [aDecoder decodeObjectForKey:@"time"];
    }
    return self;
}

@end
