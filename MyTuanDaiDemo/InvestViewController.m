//
//  InvestViewController.m
//  MyTuanDaiDemo
//
//  Created by 林新佳 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "InvestViewController.h"

@interface InvestViewController ()

//POP动画引擎的动画效果非常流畅，因为它使用了CADisplayLink来刷新画面（帧）
@property (nonatomic ,strong) CADisplayLink *displayLink;
@property (nonatomic) NSInteger count;
@property (nonatomic ,strong) NSMutableArray *array;
@end

@implementation InvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self myCalender];
    
    
    
    NSArray *names = @[@"张三", @"李五", @"王五"];
    NSPredicate *containsN = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH '张' OR  SELF CONTAINS '王'" ];
    NSArray *array = [names filteredArrayUsingPredicate:containsN];
    NSLog(@"%@", array);
    
    
    
    
//    self.displayLink =[CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkEvent:)];
//    [self performSelector:@selector(eventOne) withObject:nil afterDelay:1.f];
//    [self performSelector:@selector(eventTwo) withObject:nil afterDelay:2.f];
    
    
    
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











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
