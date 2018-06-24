WCSDateRange
===========

Simple date range class. Simply provide a date range enum and the class will provide NSDate to/from, NSString date range. Accepts format enum as well to provide different date formats.

<img src="/screens/screen-1.png" width="50%" />

Example
------------

Simple to use: assign a `format` and `dateRange` enum and grab the results using `rangeString`.

```objc
WCSDateRange * range = [WCSDateRange new];
range.format = WCSDateRangeFormatSimple;
range.dateRange = WCSDateRangeTypeMonth;

NSLog(@"Date Range String: %@", range.rangeString);

Output: Date Range String: 06/01/2018 - 06/30/2018
```

@WrightsCS
------------

Twitter: @WrightsCS
http://www.wrightscsapps.com 


Apps using WCSDateRange
------------

If you are using this in your app, please let me know and I will add your app here!
