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

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    return NO;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    
}

- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager
{
    
}

- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager
{
    
}

- (void)locationManager:(CLLocationManager *)manager didFinishDeferredUpdatesWithError:(NSError *)error
{
    
}

@end
