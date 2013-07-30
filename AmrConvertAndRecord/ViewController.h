//
//  ViewController.h
//  AmrConvertAndRecord
//
//  Created by Jeans on 3/29/13.
//  Copyright (c) 2013 Jeans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatVoiceRecorderVC.h"
#import "VoiceConverter.h"
    
@interface ViewController : UIViewController<VoiceRecorderBaseVCDelegate,UIGestureRecognizerDelegate>

@property (retain, nonatomic)  ChatVoiceRecorderVC      *recorderVC;

@property (retain, nonatomic)   AVAudioPlayer           *player;

@property (retain, nonatomic)   IBOutlet UIButton       *recordBtn;         //录音按钮
@property (retain, nonatomic) IBOutlet UILabel *amrTowavLabel;
@property (retain, nonatomic) IBOutlet UILabel *wavToamrLabel;
@property (retain, nonatomic) IBOutlet UILabel *originWavLabel;
@property (retain, nonatomic) IBOutlet UIButton *palyAMR;
@property (copy, nonatomic)     NSString                *originWav;         //原wav文件名
@property (copy, nonatomic)     NSString                *convertAmr;        //转换后的amr文件名
@property (copy, nonatomic)     NSString                *convertWav;        //amr转wav的文件名


 
@end
