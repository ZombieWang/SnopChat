//
//  AALPCameraVCDelegate.h
//  SnopChat
//
//  Created by Frank on 2017/4/15.
//  Copyright © 2017年 Frank. All rights reserved.
//

#ifndef AALPCameraVCDelegate_h
#define AALPCameraVCDelegate_h

@protocol AAPLCameraVCDelegate <NSObject>

-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shouldEnableCameraUI:(BOOL)enable;

@end

#endif /* AALPCameraVCDelegate_h */
