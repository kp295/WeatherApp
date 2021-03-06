//
//  WACoreDataDailyWeather.h
//  WeatherApp
//
//  Created by Kenneth Pu on 7/3/14.
//  Copyright (c) 2014 Kenneth Pu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WACoreDataCity;

@interface WACoreDataDailyWeather : NSManagedObject

@property (nonatomic, strong) NSNumber * hiTemp;
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, strong) NSNumber * loTemp;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) WACoreDataCity *city;

@end
