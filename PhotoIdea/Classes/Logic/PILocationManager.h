//
//  PILocationManager.h
//  PhotoIdea
//
//  Created by Bertrand Longevialle on 5/26/13.
//  Copyright (c) 2013 Longbob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PILocationManager : NSObject<CLLocationManagerDelegate>

+ (instancetype)sharedInstance;

@end
