NSString *domainString = @"com.tomaszpoliszuk.volumecontroller";

NSMutableDictionary *tweakSettings;

static BOOL enableTweak;

static float volumeSteps;

static int showIcon;


static long long hudTypeForPortraitOrientation;

static long long hudTypeForLandscapeOrientation;


static int controlPortraitSize;

static int simplePortraitSize;


static int widthSizePortraitFor1;
static int heightSizePortraitFor1;
static int borderRadiusPortraitFor1;

static int widthSizePortraitFor2;
static int heightSizePortraitFor2;
static int borderRadiusPortraitFor2;

static int widthSizePortraitFor3;
static int heightSizePortraitFor3;
static int borderRadiusPortraitFor3;


static int controlLandscapeSize;

static int simpleLandscapeSize;

static int widthSizeLandscapeFor1;
static int heightSizeLandscapeFor1;
static int borderRadiusLandscapeFor1;

static int widthSizeLandscapeFor2;
static int heightSizeLandscapeFor2;
static int borderRadiusLandscapeFor2;

static int widthSizeLandscapeFor3;
static int heightSizeLandscapeFor3;
static int borderRadiusLandscapeFor3;


static int controlPortraitPosition;

static int positionPortraitTop;
static int positionPortraitLeft;


static int controlLandscapePosition;

static int positionLandscapeTop;
static int positionLandscapeLeft;
//	static long long orientation;
//
//	static BOOL useCustomSize;
//	static int widthSize;
//	static int heightSize;
//	static int borderRadius;
//
//	static BOOL useCustomPosition;
//	static int verticalPosition;
//	static int horizontalPosition;


void SettingsChanged() {

	NSUserDefaults *tweakSettings = [[NSUserDefaults alloc] initWithSuiteName:domainString];

	enableTweak = [([tweakSettings objectForKey:@"enableTweak"] ?: @(YES)) boolValue];

	volumeSteps = [([tweakSettings valueForKey:@"volumeSteps"] ?: @(16)) floatValue];



	showIcon = [([tweakSettings valueForKey:@"showIcon"] ?: @(999)) integerValue];

	hudTypeForPortraitOrientation = [([tweakSettings valueForKey:@"hudTypeForPortraitOrientation"] ?: @(999)) integerValue];
	hudTypeForLandscapeOrientation = [([tweakSettings valueForKey:@"hudTypeForLandscapeOrientation"] ?: @(999)) integerValue];



	controlPortraitSize = [([tweakSettings valueForKey:@"controlPortraitSize"] ?: @(999)) integerValue];


	simplePortraitSize = [([tweakSettings valueForKey:@"simplePortraitSize"] ?: @(999)) integerValue];


	widthSizePortraitFor1 = [([tweakSettings valueForKey:@"widthSizePortraitFor1"] ?: @(47)) integerValue];
	heightSizePortraitFor1 = [([tweakSettings valueForKey:@"heightSizePortraitFor1"] ?: @(148)) integerValue];
	borderRadiusPortraitFor1 = [([tweakSettings valueForKey:@"borderRadiusPortraitFor1"] ?: @(9)) integerValue];

	widthSizePortraitFor2 = [([tweakSettings valueForKey:@"widthSizePortraitFor2"] ?: @(7)) integerValue];
	heightSizePortraitFor2 = [([tweakSettings valueForKey:@"heightSizePortraitFor2"] ?: @(134)) integerValue];
	borderRadiusPortraitFor2 = [([tweakSettings valueForKey:@"borderRadiusPortraitFor2"] ?: @(3.5)) integerValue];

	widthSizePortraitFor3 = [([tweakSettings valueForKey:@"widthSizePortraitFor3"] ?: @(58)) integerValue];
	heightSizePortraitFor3 = [([tweakSettings valueForKey:@"heightSizePortraitFor3"] ?: @(170)) integerValue];
	borderRadiusPortraitFor3 = [([tweakSettings valueForKey:@"borderRadiusPortraitFor3"] ?: @(18)) integerValue];



	controlLandscapeSize = [([tweakSettings valueForKey:@"controlLandscapeSize"] ?: @(999)) integerValue];


	simpleLandscapeSize = [([tweakSettings valueForKey:@"simpleLandscapeSize"] ?: @(999)) integerValue];


	widthSizeLandscapeFor1 = [([tweakSettings valueForKey:@"widthSizeLandscapeFor1"] ?: @(209)) integerValue];
	heightSizeLandscapeFor1 = [([tweakSettings valueForKey:@"heightSizeLandscapeFor1"] ?: @(32)) integerValue];
	borderRadiusLandscapeFor1 = [([tweakSettings valueForKey:@"borderRadiusLandscapeFor1"] ?: @(5.5)) integerValue];

	widthSizeLandscapeFor2 = [([tweakSettings valueForKey:@"widthSizeLandscapeFor2"] ?: @(238)) integerValue];
	heightSizeLandscapeFor2 = [([tweakSettings valueForKey:@"heightSizeLandscapeFor2"] ?: @(5)) integerValue];
	borderRadiusLandscapeFor2 = [([tweakSettings valueForKey:@"borderRadiusLandscapeFor2"] ?: @(2.5)) integerValue];

	widthSizeLandscapeFor3 = [([tweakSettings valueForKey:@"widthSizeLandscapeFor3"] ?: @(260)) integerValue];
	heightSizeLandscapeFor3 = [([tweakSettings valueForKey:@"heightSizeLandscapeFor3"] ?: @(37)) integerValue];
	borderRadiusLandscapeFor3 = [([tweakSettings valueForKey:@"borderRadiusLandscapeFor3"] ?: @(13)) integerValue];


	controlPortraitPosition = [([tweakSettings valueForKey:@"controlPortraitPosition"] ?: @(999)) integerValue];

	positionPortraitTop = [([tweakSettings valueForKey:@"positionPortraitTop"] ?: @(141)) integerValue];
	positionPortraitLeft = [([tweakSettings valueForKey:@"positionPortraitLeft"] ?: @(32)) integerValue];



	controlLandscapePosition = [([tweakSettings valueForKey:@"controlLandscapePosition"] ?: @(999)) integerValue];

	positionLandscapeTop = [([tweakSettings valueForKey:@"positionLandscapeTop"] ?: @(20)) integerValue];
	positionLandscapeLeft = [([tweakSettings valueForKey:@"positionLandscapeLeft"] ?: @(368)) integerValue];
}

@interface SBElasticVolumeViewController : UIViewController
- (unsigned long long)axis;
@end

%hook SBVolumeControl
- (float)volumeStepDown {
	float origValue = %orig;
	if ( enableTweak && volumeSteps != 999 ) {
		return 100 / volumeSteps / 100;
	}
	return origValue;
}
- (float)volumeStepUp {
	float origValue = %orig;
	if ( enableTweak && volumeSteps != 999 ) {
		return 100 / volumeSteps / 100;
	}
	return origValue;
}
%end

%hook SBElasticVolumeViewController

- (unsigned long long)axis {
	long long origValue = %orig;
	if ( enableTweak ) {
		if ( origValue == 1 && hudTypeForLandscapeOrientation != 999 ) {
			return hudTypeForLandscapeOrientation;
		}
		if ( origValue == 2 && hudTypeForPortraitOrientation != 999 ) {
			return hudTypeForPortraitOrientation;
		}
	}
	return origValue;
}

- (double)glyphScaleForState:(long long)arg1 {
	double origValue = %orig;
	if ( enableTweak && showIcon == 404 ) {
		return 0.01;
		if ( simplePortraitSize == 2 && [self axis] == 2 ) {
			return 0.01;
		}
		if ( simpleLandscapeSize == 2 && [self axis] == 1 ) {
			return 0.01;
		}
	}
	return origValue;
}

//	size
//	999	=	Default
//	0	=	Disable
//	2	=	Small
//	1	=	Regular
//	3	=	Big

- (CGSize)sizeForState:(long long)arg1 useSpringData:(bool)arg2 {
	CGSize origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
//	simple
			if ( [self axis] == 2 ) {
//	portrait
				if (arg1 != 0) {
					if (simplePortraitSize == 1) {
						return CGSizeMake(
							47,
							148
						);
					}
					if (simplePortraitSize == 2) {
						return CGSizeMake(
							7,
							134
						);
					}
					if (simplePortraitSize == 3) {
						return CGSizeMake(
							58,
							170
						);
					}
				}
			}
		}
		if ( controlLandscapeSize == 0 ) {
//	simple
			if ( [self axis] == 1 ) {
//	landscape
				if (arg1 != 0) {
					if (simpleLandscapeSize == 1) {
						return CGSizeMake(
							209,
							32
						);
					}
					if (simpleLandscapeSize == 2) {
						return CGSizeMake(
							238,
							5
						);
					}
					if (simpleLandscapeSize == 3) {
						return CGSizeMake(
							260,
							37
						);
					}
				}
			}
		}
		if ( controlPortraitSize == 1 ) {
//	custom
			if ( [self axis] == 2 ) {
//	portrait
				if (arg1 == 1) {
					return CGSizeMake(
						widthSizePortraitFor1,
						heightSizePortraitFor1
					);
				}
				if (arg1 == 2) {
					return CGSizeMake(
						widthSizePortraitFor2,
						heightSizePortraitFor2
					);
				}
				if (arg1 == 3) {
					return CGSizeMake(
						widthSizePortraitFor3,
						heightSizePortraitFor3
					);
				}
			}
		}
		if ( controlLandscapeSize == 1 ) {
//	custom
			if ( [self axis] == 1 ) {
//	landscape
				if (arg1 == 1) {
					return CGSizeMake(
						widthSizeLandscapeFor1,
						heightSizeLandscapeFor1
					);
				}
				if (arg1 == 2) {
					return CGSizeMake(
						widthSizeLandscapeFor2,
						heightSizeLandscapeFor2
					);
				}
				if (arg1 == 3) {
					return CGSizeMake(
						widthSizeLandscapeFor3,
						heightSizeLandscapeFor3
					);
				}
			}
		}
	}
	return origValue;
}
- (double)cornerRadiusForState:(long long)arg1 useSpringData:(bool)arg2 {
	double origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitSize == 0 ) {
//	simple
			if ( [self axis] == 2 ) {
//	portrait
				if (arg1 != 0) {
					if (simplePortraitSize == 1) {
						return 9;
					}
					if (simplePortraitSize == 2) {
						return 3.5;
					}
					if (simplePortraitSize == 3) {
						return 18;
					}
				}
			}
		}
		if ( controlLandscapeSize == 0 ) {
//	simple
			if ( [self axis] == 1 ) {
//	landscape
				if (arg1 != 0) {
					if (simpleLandscapeSize == 1) {
						return 5.5;
					}
					if (simpleLandscapeSize == 2) {
						return 2.5;
					}
					if (simpleLandscapeSize == 3) {
						return 13;
					}
				}
			}
		}
		if ( controlPortraitSize == 1 ) {
//	custom
			if ( [self axis] == 2 ) {
//	portrait
				if (arg1 == 1) {
					return borderRadiusPortraitFor1;
				}
				if (arg1 == 2) {
					return borderRadiusPortraitFor2;
				}
				if (arg1 == 3) {
					return borderRadiusPortraitFor3;
				}
			}
		}
		if ( controlLandscapeSize == 1 ) {
//	custom
			if ( [self axis] == 1 ) {
//	landscape
				if (arg1 == 1) {
					return borderRadiusLandscapeFor1;
				}
				if (arg1 == 2) {
					return borderRadiusLandscapeFor2;
				}
				if (arg1 == 3) {
					return borderRadiusLandscapeFor3;
				}
			}
		}
	}
	return origValue;
}

- (CGPoint)centerForState:(long long)arg1 containerViewSize:(CGSize)arg2 bounds:(CGRect)arg3 useSpringData:(bool)arg4 {
	CGPoint origValue = %orig;
	if ( enableTweak ) {
		if ( controlPortraitPosition == 1 ) {
			if ( [self axis] == 2 ) {
				return CGPointMake(
					positionPortraitLeft,
					positionPortraitTop
				);
			}
		}
		if ( controlLandscapePosition == 1 ) {
			if ( [self axis] == 1 ) {
				return CGPointMake(
					positionLandscapeLeft,
					positionLandscapeTop
				);
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
