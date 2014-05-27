//
//  PILocationManager.m
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/26/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import "PILocationManager.h"

@interface PILocationManager ()

@property (nonatomic, strong) CLLocationManager *locationManager;

@end


@implementation PILocationManager

+ (PILocationManager *)sharedInstance
{
    static PILocationManager *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[PILocationManager alloc]init];
    });
    return shared;
}

#pragma mark - CLLocationManagerDelegate

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    return NO;
}


@end
