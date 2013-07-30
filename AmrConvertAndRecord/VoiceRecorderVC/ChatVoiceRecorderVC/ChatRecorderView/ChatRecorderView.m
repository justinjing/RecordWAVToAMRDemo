//
//  ChatRecorderView.m
//  Jeans
//
//  Created by Jeans on 3/24/13.
//  Copyright (c) 2013 Jeans. All rights reserved.
//

#import "ChatRecorderView.h"

#define kTrashImage1         [UIImage imageNamed:@"recorder_trash_can0.png"]
#define kTrashImage2         [UIImage imageNamed:@"recorder_trash_can1.png"]
#define kTrashImage3         [UIImage imageNamed:@"recorder_trash_can2.png"]

@interface ChatRecorderView(){
    NSMutableArray         *peakImageAry;
    NSArray         *trashImageAry;
    BOOL            isPrepareDelete;
    BOOL            isTrashCanRocking;
}

@end

@implementation ChatRecorderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initilization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initilization];
    }
    return self;
}

- (void)initilization{
    //初始化音量peak峰值图片数组
 
  
    peakImageAry = [[NSMutableArray alloc]initWithCapacity:2];
    for (int i=1; i<9; i++)
    {
        [peakImageAry addObject:[UIImage imageNamed:[NSString stringWithFormat:@"RecordingSignal00%d.png",i]]];
    }
 
    NSLog(@" peakImageAry ==%d", [peakImageAry count]);
    trashImageAry = [[NSArray alloc]initWithObjects:kTrashImage1,kTrashImage2,kTrashImage3,kTrashImage2, nil];
 
    self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"chat_voice_03.png"]];
 
    UIImageView *phoneIV=[[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 36, 100)];
    phoneIV.image=[UIImage imageNamed:@"RecordingBkg"];
    [self addSubview:phoneIV];
    
    
    _peakMeterIV=[[UIImageView alloc]initWithFrame:CGRectMake(76,48, 18, 61)];
    _peakMeterIV.image=[UIImage imageNamed:@"RecordingSignal000"];
    [self addSubview:_peakMeterIV];
}

- (void)dealloc {
    [peakImageAry release];
    [trashImageAry release];
    [_peakMeterIV release];
    [_trashCanIV release];
    [_countDownLabel release];
    [super dealloc];
}

#pragma mark -还原显示界面
- (void)restoreDisplay{
    //停止震动
    [self rockTrashCan:NO];
    //还原倒计时文本
    _countDownLabel.text = @"";
}

#pragma mark - 是否准备删除
- (void)prepareToDelete:(BOOL)_preareDelete{
    if (_preareDelete != isPrepareDelete) {
        isPrepareDelete = _preareDelete;
        [self rockTrashCan:isPrepareDelete];
    }
}
#pragma mark - 是否摇晃垃圾桶
- (void)rockTrashCan:(BOOL)_isTure{
    if (_isTure != isTrashCanRocking) {
        isTrashCanRocking = _isTure;
        if (isTrashCanRocking) {
            //摇晃
            _trashCanIV.animationImages = trashImageAry;
            _trashCanIV.animationRepeatCount = 0;
            _trashCanIV.animationDuration = 1;
            [_trashCanIV startAnimating];
        }else{
            //停止
            if (_trashCanIV.isAnimating)
                [_trashCanIV stopAnimating];
            _trashCanIV.animationImages = nil;
            _trashCanIV.image = kTrashImage1;
        }
    }
}


#pragma mark - 更新音频峰值
- (void)updateMetersByAvgPower:(float)lowPassResults{
    
    if (0<lowPassResults<=0.06)
    {
        [_peakMeterIV setImage:[UIImage imageNamed:@"RecordingSignal000.png"]];
        
    }
    else if (0.06<lowPassResults<=0.13) {
        [_peakMeterIV setImage:[UIImage imageNamed:@"RecordingSignal000.png"]];
        
    }
    else if (0.13<lowPassResults<=0.20) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:0]];
        
    }
    else if (0.20<lowPassResults<=0.27) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:0]];
        
    }
    else if (0.27<lowPassResults<=0.34) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:1]];
        
    }
    else if (0.34<lowPassResults<=0.41) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:2]];
        
    }
    else if (0.41<lowPassResults<=0.48) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:3]];
        
    }
    else if (0.48<lowPassResults<=0.55) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:4]];
        
    }
    else if (0.55<lowPassResults<=0.62) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:4]];
        
    }
    else if (0.62<lowPassResults<=0.69) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:5]];
        
    }
    else if (0.69<lowPassResults<=0.76) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:6]];
        
    }
    else if (0.76<lowPassResults<=0.83) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:6]];
        
    }
    else if (0.83<lowPassResults<=0.9) {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:7]];
        
    }
    else {
        [_peakMeterIV setImage:[peakImageAry objectAtIndex:7]];
        
    }

}

@end
