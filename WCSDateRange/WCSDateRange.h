//
//  WCSDateRange.h
//  Created by Aaron Wright on 6/19/18.
//  Copyright © 2018 Wrights Creative Services, L.L.C. All rights reserved.
//  http://www.wrightscsapps.com
//

#import <Foundation/Foundation.h>

/** Date format options, should be set first */
typedef NS_ENUM(NSInteger, WCSDateRangeFormat) {
    /** Shortest date format, default */
    WCSDateRangeFormatDefault = 0,
    /** Simple date format */
    WCSDateRangeFormatSimple = 1,
    /** Format date string with date and time */
    WCSDateRangeFormatFull,
    /** Format date string to time only */
    WCSDateRangeFormatTimeOnly
};

/** Date range options */
typedef NS_ENUM(NSInteger, WCSDateRangeType) {
    /** Midnight to current date and time */
    WCSDateRangeTypeToday = 1,
    /** Beginning of the current Week to current date and time */
    WCSDateRangeTypeWeek = 7,
    /** Current Month beginning from day 1 to end of month (29th/30th/31st) */
    WCSDateRangeTypeMonth = 30
};

@interface WCSDateRange : NSObject

/** Set date format for date range string */
@property (nonatomic, assign) WCSDateRangeFormat format;

/** Calculate date range from range type */
@property (nonatomic, assign) WCSDateRangeType dateRange;

/** Calculated ending date range from range type */
@property (nonatomic, readonly) NSDate * to;

/** Calculated ending date range from range type */
@property (nonatomic, readonly) NSDate * from;

/** String date range from range type */
@property (nonatomic, readonly) NSString * rangeString;

@end
