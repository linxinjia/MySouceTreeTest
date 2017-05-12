//
//  InvestViewController.m
//  MyTuanDaiDemo
//
//  Created by 林新佳 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "InvestViewController.h"

@interface InvestViewController ()<NSURLConnectionDataDelegate>
{
    NSURLConnection *_connection;
}

@property (nonatomic ,strong) CADisplayLink *displayLink;
@property (nonatomic) NSInteger count;
@property (nonatomic ,strong) NSMutableArray *array;
@end

@implementation InvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self myCalender];
    [self connectionPart];
    
    
    //谓词
    NSArray *names = @[@"张三", @"李五", @"王五"];
    NSPredicate *containsN = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH '张' OR  SELF CONTAINS '王'" ];
    NSArray *array = [names filteredArrayUsingPredicate:containsN];
    NSLog(@"%@", array);
    
    
    
    
    self.displayLink =[CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkEvent:)];
    [self performSelector:@selector(eventOne) withObject:nil afterDelay:1.f];
    [self performSelector:@selector(eventTwo) withObject:nil afterDelay:2.f];
    
    
    
    NSArray *arrayFromJson;
    _array = [NSMutableArray array];
    [_array addObject:@"wefergegre"];
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/lxj.json"];
    if ([NSJSONSerialization isValidJSONObject:_array]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_array options:NSJSONWritingPrettyPrinted error:nil];
        [jsonData writeToFile:filePath atomically:YES];
        
        jsonData = [NSData dataWithContentsOfFile:filePath];
        arrayFromJson = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    }
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor grayColor];
    
    UIColor *color = label.backgroundColor;
    CGFloat red,green,blue,alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
}

#pragma mark displayLink Event
- (void)displayLinkEvent:(id)object{
    self.count ++;
    NSLog(@"count = %ld",self.count);
}

- (void)eventOne{
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)eventTwo{
    [self.displayLink invalidate];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

//日历
- (void)myCalender
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm tt"];
    NSString *dateString = [dateFormatter stringFromDate:date];

    
    
    
    NSDate *startDate;
    NSTimeInterval secondsOfMonth;
    NSCalendar *calender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    [calender setTimeZone:[NSTimeZone systemTimeZone]];
    
    [calender rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:&secondsOfMonth forDate:date];
    
    
    
    NSArray *array = [@"werewr" componentsSeparatedByString:@"a"];
    NSString *trimmedString = [@" DhkYdjF " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    trimmedString = [trimmedString lowercaseString];
    if ([trimmedString hasSuffix:@"F"]) {
        return;
    }
    NSMutableArray *muArray = [NSMutableArray array];
    [muArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return obj1 < obj2;
    }];
    [trimmedString rangeOfString:@"]" options:NSBackwardsSearch];
    
    
    trimmedString = @"00:01.25";
    const char *str = [trimmedString cStringUsingEncoding:NSUTF8StringEncoding];
    int min,sec,per_sec;
    sscanf(str, "%d:%d.%d",&min,&sec,&per_sec);
    NSUInteger milliSeconds = min*60*1000 + sec*1000 + per_sec*10;
}


//异步下载
- (void)connectionPart
{
    
}
//错误
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}
//开始接收到头部数据
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}
//开始接收到正文数据（可能多次调用）
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
}
//完成加载
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
