NSString *domainString = @"com.tomaszpoliszuk.volumecontroller";

static BOOL enableTweak;

static int controlPortraitSize;
static int simplePortraitSize;

static int portraitState1Width;
static int portraitState1Height;
static int portraitState1CornerRadius;

static int portraitState2Width;
static int portraitState2Height;
static int portraitState2CornerRadius;

static int portraitState3Width;
static int portraitState3Height;
static int portraitState3CornerRadius;

static int portraitYaxis;
static NSString *portraitXaxisString = @"";
static int portraitXaxis;
static NSString *portraitYaxisString = @"";


static int controlLandscapeSize;
static int simpleLandscapeSize;

static int landscapeState1Width;
static int landscapeState1Height;
static int landscapeState1CornerRadius;

static int landscapeState2Width;
static int landscapeState2Height;
static int landscapeState2CornerRadius;

static int landscapeState3Width;
static int landscapeState3Height;
static int landscapeState3CornerRadius;

static int landscapeYaxis;
static NSString *landscapeXaxisString = @"";
static int landscapeXaxis;
static NSString *landscapeYaxisString = @"";

static float volumeSteps;

void SettingsChanged () {

	NSUserDefaults *tweakSettings = [[NSUserDefaults alloc] initWithSuiteName:domainString];

	enableTweak = [ ( [tweakSettings objectForKey:@"enableTweak"] ?: @ ( YES ) ) boolValue];

	controlPortraitSize = [ ( [tweakSettings valueForKey:@"controlPortraitSize"] ?: @ ( 999 ) ) integerValue];
	simplePortraitSize = [ ( [tweakSettings valueForKey:@"simplePortraitSize"] ?: @ ( 2 ) ) integerValue];

	portraitState1Width = [[tweakSettings valueForKey:@"portraitState1Width"] integerValue];
	portraitState1Height = [[tweakSettings valueForKey:@"portraitState1Height"] integerValue];
	portraitState1CornerRadius = [[tweakSettings valueForKey:@"portraitState1CornerRadius"] integerValue];

	portraitState2Width = [[tweakSettings valueForKey:@"portraitState2Width"] integerValue];
	portraitState2Height = [[tweakSettings valueForKey:@"portraitState2Height"] integerValue];
	portraitState2CornerRadius = [[tweakSettings valueForKey:@"portraitState2CornerRadius"] integerValue];

	portraitState3Width = [[tweakSettings valueForKey:@"portraitState3Width"] integerValue];
	portraitState3Height = [[tweakSettings valueForKey:@"portraitState3Height"] integerValue];
	portraitState3CornerRadius = [[tweakSettings valueForKey:@"portraitState3CornerRadius"] integerValue];

	portraitYaxis = [[tweakSettings valueForKey:@"portraitYaxis"] integerValue];
	portraitXaxisString = [tweakSettings objectForKey:@"portraitXaxis"];
	portraitXaxis = [[tweakSettings valueForKey:@"portraitXaxis"] integerValue];
	portraitYaxisString = [tweakSettings objectForKey:@"portraitYaxis"];


	controlLandscapeSize = [ ( [tweakSettings valueForKey:@"controlLandscapeSize"] ?: @ ( 999 ) ) integerValue];
	simpleLandscapeSize = [ ( [tweakSettings valueForKey:@"simpleLandscapeSize"] ?: @ ( 2 ) ) integerValue];

	landscapeState1Width = [[tweakSettings valueForKey:@"landscapeState1Width"] integerValue];
	landscapeState1Height = [[tweakSettings valueForKey:@"landscapeState1Height"] integerValue];
	landscapeState1CornerRadius = [[tweakSettings valueForKey:@"landscapeState1CornerRadius"] integerValue];

	landscapeState2Width = [[tweakSettings valueForKey:@"landscapeState2Width"] integerValue];
	landscapeState2Height = [[tweakSettings valueForKey:@"landscapeState2Height"] integerValue];
	landscapeState2CornerRadius = [[tweakSettings valueForKey:@"landscapeState2CornerRadius"] integerValue];

	landscapeState3Width = [[tweakSettings valueForKey:@"landscapeState3Width"] integerValue];
	landscapeState3Height = [[tweakSettings valueForKey:@"landscapeState3Height"] integerValue];
	landscapeState3CornerRadius = [[tweakSettings valueForKey:@"landscapeState3CornerRadius"] integerValue];

	landscapeYaxis = [[tweakSettings valueForKey:@"landscapeYaxis"] integerValue];
	landscapeXaxisString = [tweakSettings objectForKey:@"landscapeXaxis"];
	landscapeXaxis = [[tweakSettings valueForKey:@"landscapeXaxis"] integerValue];
	landscapeYaxisString = [tweakSettings objectForKey:@"landscapeYaxis"];

	volumeSteps = [[tweakSettings valueForKey:@"volumeSteps"] floatValue];
}

@interface SBElasticVolumeViewController : UIViewController
- (unsigned long long)axis;
@end
@interface SBVolumeHUDSettings
-(double)portraitState1CornerRadius;
-(double)portraitState1Height;
-(double)portraitState1Width;
-(double)portraitState2CornerRadius;
-(double)portraitState2Height;
-(double)portraitState2Width;
-(double)portraitState3CornerRadius;
-(double)portraitState3Height;
-(double)portraitState3Width;

-(double)landscapeState1CornerRadius;
-(double)landscapeState1Height;
-(double)landscapeState1Width;
-(double)landscapeState2CornerRadius;
-(double)landscapeState2Height;
-(double)landscapeState2Width;
-(double)landscapeState3CornerRadius;
-(double)landscapeState3Height;
-(double)landscapeState3Width;
@end

%hook SBVolumeHUDSettings
-(double)portraitState1Width {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 2 ) {
				return [self portraitState2Width];
			} else if ( simplePortraitSize == 3 ) {
				return [self portraitState3Width];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState1Width > 0 ) {
				return portraitState1Width;
			}
		}
	}
	return origValue;
}
-(double)portraitState1Height {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 2 ) {
				return [self portraitState2Height];
			} else if ( simplePortraitSize == 3 ) {
				return [self portraitState3Height];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState1Height > 0 ) {
				return portraitState1Height;
			}
		}
	}
	return origValue;
}
-(double)portraitState1CornerRadius {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 2 ) {
				return [self portraitState2CornerRadius];
			}
			if ( simplePortraitSize == 3 ) {
				return [self portraitState3CornerRadius];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState1CornerRadius > 0 ) {
				return portraitState1CornerRadius;
			}
		}
	}
	return origValue;
}
-(double)portraitState2Width {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 1 ) {
				return [self portraitState1Width];
			}
			if ( simplePortraitSize == 3 ) {
				return [self portraitState3Width];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState2Width > 0 ) {
				return portraitState2Width;
			}
		}
	}
	return origValue;
}
-(double)portraitState2Height {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 1 ) {
				return [self portraitState1Height];
			} else if ( simplePortraitSize == 3 ) {
				return [self portraitState3Height];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState2Height > 0 ) {
				return portraitState2Height;
			}
		}
	}
	return origValue;
}
-(double)portraitState2CornerRadius {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 1 ) {
				return [self portraitState1CornerRadius];
			} else if ( simplePortraitSize == 3 ) {
				return [self portraitState3CornerRadius];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState2CornerRadius > 0 ) {
				return portraitState2CornerRadius;
			}
		}
	}
	return origValue;
}
-(double)portraitState3Width {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 1 ) {
				return [self portraitState1Width];
			} else if ( simplePortraitSize == 2 ) {
				return [self portraitState2Width];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState3Width > 0 ) {
				return portraitState3Width;
			}
		}
	}
	return origValue;
}
-(double)portraitState3Height {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 1 ) {
				return [self portraitState1Height];
			} else if ( simplePortraitSize == 2 ) {
				return [self portraitState2Height];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState3Height > 0 ) {
				return portraitState3Height;
			}
		}
	}
	return origValue;
}
-(double)portraitState3CornerRadius {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
			if ( simplePortraitSize == 1 ) {
				return [self portraitState1CornerRadius];
			} else if ( simplePortraitSize == 2 ) {
				return [self portraitState2CornerRadius];
			}
		} else if ( controlPortraitSize == 1 ) {
			if ( portraitState3CornerRadius > 0 ) {
				return portraitState3CornerRadius;
			}
		}
	}
	return origValue;
}



-(double)landscapeState1Width {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 2 ) {
				return [self landscapeState2Width];
			} else if ( simpleLandscapeSize == 3 ) {
				return [self landscapeState3Width];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState1Width > 0 ) {
				return landscapeState1Width;
			}
		}
	}
	return origValue;
}
-(double)landscapeState1Height {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 2 ) {
				return [self landscapeState2Height];
			} else if ( simpleLandscapeSize == 3 ) {
				return [self landscapeState3Height];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState1Height > 0 ) {
				return landscapeState1Height;
			}
		}
	}
	return origValue;
}
-(double)landscapeState1CornerRadius {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 2 ) {
				return [self landscapeState2CornerRadius];
			} else if ( simpleLandscapeSize == 3 ) {
				return [self landscapeState3CornerRadius];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState1CornerRadius > 0 ) {
				return landscapeState1CornerRadius;
			}
		}
	}
	return origValue;
}

-(double)landscapeState2Width {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 1 ) {
				return [self landscapeState1Width];
			} else if ( simpleLandscapeSize == 3 ) {
				return [self landscapeState3Width];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState2Width > 0 ) {
				return landscapeState2Width;
			}
		}
	}
	return origValue;
}
-(double)landscapeState2Height {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 1 ) {
				return [self landscapeState1Height];
			} else if ( simpleLandscapeSize == 3 ) {
				return [self landscapeState3Height];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState2Height > 0 ) {
				return landscapeState2Height;
			}
		}
	}
	return origValue;
}
-(double)landscapeState2CornerRadius {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 1 ) {
				return [self landscapeState1CornerRadius];
			} else if ( simpleLandscapeSize == 3 ) {
				return [self landscapeState3CornerRadius];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState2CornerRadius > 0 ) {
				return landscapeState2CornerRadius;
			}
		}
	}
	return origValue;
}
-(double)landscapeState3Width {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 2 ) {
				return [self landscapeState2Width];
			} else if ( simpleLandscapeSize == 1 ) {
				return [self landscapeState1Width];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState3Width > 0 ) {
				return landscapeState3Width;
			}
		}
	}
	return origValue;
}
-(double)landscapeState3Height {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 2 ) {
				return [self landscapeState2Height];
			} else if ( simpleLandscapeSize == 1 ) {
				return [self landscapeState1Height];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState3Height > 0 ) {
				return landscapeState3Height;
			}
		}
	}
	return origValue;
}
-(double)landscapeState3CornerRadius {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlLandscapeSize == 0 ) {
			if ( simpleLandscapeSize == 2 ) {
				return [self landscapeState2CornerRadius];
			} else if ( simpleLandscapeSize == 1 ) {
				return [self landscapeState1CornerRadius];
			}
		} else if ( controlLandscapeSize == 1 ) {
			if ( landscapeState3CornerRadius > 0 ) {
				return landscapeState3CornerRadius;
			}
		}
	}
	return origValue;
}
-(float)volumeStepDelta {
	float origValue = %orig;
	if ( enableTweak && volumeSteps > 0 ) {
		return 100 / volumeSteps / 100;
	}
	return origValue;
}
%end

%hook SBElasticVolumeViewController
//	state
//	2	=	Small
//	1	=	Regular
//	3	=	Big
- (CGPoint) centerForState:(long long)arg1 containerViewSize:(CGSize)arg2 bounds:(CGRect)arg3 useSpringData:(bool)arg4 {
	CGPoint origValue = %orig;
	if ( enableTweak ) {
		float displayWidth = [UIScreen mainScreen].bounds.size.width;
		float displayHeight = [UIScreen mainScreen].bounds.size.height;
		if ( [self axis] == 2 ) {
//	portrait
			int xAxis = origValue.x;
			int yAxis = origValue.y;
			if ( portraitXaxisString.length > 0 ) {
				xAxis = ( displayWidth - arg2.width ) / 100 * portraitXaxis + arg2.width / 2;
			}
			if ( portraitYaxisString.length > 0 ) {
				yAxis = ( displayHeight - arg2.height ) / 100 * portraitYaxis + arg2.height / 2;
			}
			return CGPointMake (
				xAxis,
				yAxis
			) ;
		}
		if ( [self axis] == 1 ) {
//	landscape
			int xAxis = origValue.x;
			int yAxis = origValue.y;
			if ( landscapeXaxisString.length > 0 ) {
				xAxis = ( displayWidth - arg2.width ) / 100 * landscapeXaxis + arg2.width / 2;
			}
			if ( landscapeYaxisString.length > 0 ) {
				yAxis = ( displayHeight - arg2.height ) / 100 * landscapeYaxis + arg2.height / 2;
			}
			return CGPointMake (
				xAxis,
				yAxis
			) ;
		}
	}
	return origValue;
}
-(double)glyphScaleForState:(long long)arg1 {
	double origValue = %orig;
	if ( [self axis] == 2 ) {
		if ( controlPortraitSize == 0 && simplePortraitSize == 2 ) {
			return 0.01;
		} else if ( controlPortraitSize == 1 ) {
			if ( ( ( portraitState1Width > 0 && portraitState1Width < 40 ) || ( portraitState1Height > 0 && portraitState1Height < 40 ) ) && arg1 == 1 ) {
				return 0.01;
			} else if ( ( ( portraitState2Width > 0 && portraitState2Width < 40 ) || ( portraitState2Height > 0 && portraitState2Height < 40 ) ) && arg1 == 2 ) {
				return 0.01;
			} else if ( ( ( portraitState3Width > 0 && portraitState3Width < 40 ) || ( portraitState3Height > 0 && portraitState3Height < 40 ) ) && arg1 == 3 ) {
				return 0.01;
			}
		}
	}
	if ( [self axis] == 1 ) {
		if ( controlLandscapeSize == 0 && simpleLandscapeSize == 2 ) {
			return 0.01;
		} else if ( controlLandscapeSize == 1 ) {
			if ( ( ( landscapeState1Height > 0 && landscapeState1Height < 40 ) || ( landscapeState1Width > 0 && landscapeState1Width < 40 ) ) && arg1 == 1 ) {
				return 0.01;
			} else if ( ( ( landscapeState2Height > 0 && landscapeState2Height < 40 ) || ( landscapeState2Width > 0 && landscapeState2Width < 40 ) ) && arg1 == 2 ) {
				return 0.01;
			} else if ( ( ( landscapeState3Height > 0 && landscapeState3Height < 40 ) || ( landscapeState3Width > 0 && landscapeState3Width < 40 ) ) && arg1 == 3 ) {
				return 0.01;
			}
		}
	}
	return origValue;
}
%end

%ctor {
	SettingsChanged();
	CFNotificationCenterAddObserver(
		CFNotificationCenterGetDarwinNotifyCenter(),
		NULL,
		(CFNotificationCallback)SettingsChanged,
		CFSTR("com.tomaszpoliszuk.volumecontroller.settingschanged"),
		NULL,
		CFNotificationSuspensionBehaviorDeliverImmediately
	);
	%init;
}
