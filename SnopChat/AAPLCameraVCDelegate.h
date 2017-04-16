//
//  AAPLCameraVCDelegate.h
//  SnopChat
//
//  Created by Frank on 2017/4/15.
//  Copyright © 2017年 Frank. All rights reserved.
//

#ifndef AAPLCameraVCDelegate_h
#define AAPLCameraVCDelegate_h

@protocol AAPLCameraVCDelegate <NSObject>
    
-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shouldEnableCameraUI:(BOOL)enable;
-(void)canStartRecording;
-(void)recordingHasStarted;
-(void)videoRecordingComplete:(NSURL*)videoURL;
-(void)videoRecordingFailed;
-(void)snapshotTaken:(NSData*)snapshotData;
-(void)snapshotFailed;
@end

#endif /* AAPLCameraVCDelegate_h */
