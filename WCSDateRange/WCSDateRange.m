//
//  WCSDateRange.m
//  Created by Aaron Wright on 6/19/18.
//  Copyright © 2018 Wrights Creative Services, L.L.C. All rights reserved.
//  http://www.wrightscsapps.com
//

#import "WCSDateRange.h"

@interface WCSDateRange ()
@property (nonatomic, strong) NSDate * dateTo, * dateFrom;
@property (nonatomic, strong) NSString * dateRangeString;
@end

@implementation WCSDateRange

- (NSString*)rangeDate:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString * formatString = @"MM/dd/yy";
    switch ( self.format ) {
        default:
        case WCSDateRangeFormatDefault: {
            formatString = @"MM/dd/yy";
            break;
        }
        case WCSDateRangeFormatSimple: {
            formatString = @"MM/dd/yyyy";
            break;
        }
        case WCSDateRangeFormatFull: {
            formatString = @"MM/dd/yyyy HH:mm:ss a";
            break;
        }
        case WCSDateRangeFormatTimeOnly: {
            formatString = @"HH:mm:ss a";
            break;
        }
    }
    dateFormatter.dateFormat = formatString;
    return [dateFormatter stringFromDate:date];
}

- (void)setDateRange:(WCSDateRangeType)dateRange {
    _dateRange = dateRange;

    NSDate * starting = [NSDate date];
    NSDate * ending = [NSDate date];
    
    NSCalendarUnit units =  NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSDateComponents * component = [[NSDateComponents alloc] init];
    
    switch ( _dateRange ) {
        default:
        case WCSDateRangeTypeToday: {
            component = [calendar components:units fromDate:starting];
            component.hour = 0;
            component.minute = 0;
            component.second = 0;
            component.year = component.year;
            
            starting = [calendar dateFromComponents:component];
            break;
        }
        case WCSDateRangeTypeWeek: {
            NSDateComponents * subtract = [[NSDateComponents alloc] init];
            component = [calendar components:NSCalendarUnitWeekday fromDate:starting];
            subtract.day = -([component weekday] - [calendar firstWeekday]);
            
            starting = [calendar dateByAddingComponents:subtract toDate:starting options:0];
            break;
        }
        case WCSDateRangeTypeMonth: {
            component = [calendar components:units fromDate:[NSDate date]];
            
            component.day = 1;
            component.hour = 0;
            component.minute = 0;
            component.second = 0;
            starting = [calendar dateFromComponents:component];
            
            NSRange dayRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
            
            component.day = dayRange.length;
            component.hour = 11;
            component.minute = 59;
            component.second = 59;
            ending = [calendar dateFromComponents:component];
            break;
        }
    }
    
    self.dateFrom = starting;
    self.dateTo = ending;
    self.dateRangeString = [NSString stringWithFormat:@"%@ - %@", [self rangeDate:self.from], [self rangeDate:self.to]];
}

#pragma mark - Read-Only

- (NSDate*)from { return self.dateFrom; }

- (NSDate*)to { return self.dateTo; }

- (NSString*)rangeString { return self.dateRangeString; }

@end
