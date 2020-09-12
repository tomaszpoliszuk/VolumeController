#import <Preferences/PSListController.h>
#include <spawn.h>

NSString *domainString = @"com.tomaszpoliszuk.volumecontroller";

@interface NSConcreteNotification : NSNotification
@end

@interface PSListController (VolumeController)
- (BOOL)containsSpecifier:(id)arg1;
- (void)_returnKeyPressed:(NSConcreteNotification *)notification;
@end

@interface VolumeControllerMainPreferences : PSListController
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
@property (nonatomic, retain) UIBarButtonItem *respringButton;
@end

@implementation VolumeControllerMainPreferences
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

- (void)_returnKeyPressed:(NSConcreteNotification *)notification {
	[self.view endEditing:YES];
	[super _returnKeyPressed:notification];
}

- (void)resetSettings {
	NSUserDefaults *tweakSettings = [[NSUserDefaults alloc] initWithSuiteName:domainString];
	UIAlertController *resetSettingsAlert = [UIAlertController alertControllerWithTitle:@"Reset Volume Controller Settings" message:@"Do you want to reset settings?" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
		for(NSString* key in [[tweakSettings dictionaryRepresentation] allKeys]) {
			[tweakSettings removeObjectForKey:key];
		}
		[tweakSettings synchronize];
		[self reloadSpecifiers];
	}];
	UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
	[resetSettingsAlert addAction:cancel];
	[resetSettingsAlert addAction:confirm];
	[self presentViewController:resetSettingsAlert animated:YES completion:nil];
}

-(void)sourceCode {
	NSURL *sourceCode = [NSURL URLWithString:@"https://github.com/tomaszpoliszuk/VolumeController"];
	[[UIApplication sharedApplication] openURL:sourceCode options:@{} completionHandler:nil];
}
-(void)reportIssueAtGithub {
	NSURL *reportIssueAtGithub = [NSURL URLWithString:@"https://github.com/tomaszpoliszuk/VolumeController/issues/new"];
	[[UIApplication sharedApplication] openURL:reportIssueAtGithub options:@{} completionHandler:nil];
}
-(void)TomaszPoliszukAtGithub {
	UIApplication *application = [UIApplication sharedApplication];
	NSString *username = @"tomaszpoliszuk";
	NSURL *githubWebsite = [NSURL URLWithString:[@"https://github.com/" stringByAppendingString:username]];
	[application openURL:githubWebsite options:@{} completionHandler:nil];
}
-(void)TomaszPoliszukAtTwitter {
	UIApplication *application = [UIApplication sharedApplication];
	NSString *username = @"tomaszpoliszuk";
	NSURL *twitterWebsite = [NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:username]];
	[application openURL:twitterWebsite options:@{} completionHandler:nil];
}
@end

@interface DismissKeyboardTapGesture : NSObject <UIGestureRecognizerDelegate>
@end
@implementation DismissKeyboardTapGesture
- (id)initWithView:(UIView *)view {
	self = [super init];
	if (self) {
		UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
		singleTap.cancelsTouchesInView = NO;
		singleTap.delegate = self;
		[view addGestureRecognizer:singleTap];
		if ([view respondsToSelector:@selector(setKeyboardDismissMode:)]) {
			// Bonus effect to dismiss keyboard by scrolling
			((UIScrollView *)view).keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
		}
	}
	return self;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	// Don't stop any existing gestures in our view from working
	if (otherGestureRecognizer.view == gestureRecognizer.view) {
		return YES;
	}
	return NO;
}
- (void)singleTap:(UIGestureRecognizer*)gestureRecognizer {
	// Close keyboard for any text edit views that are children of the main view
	[gestureRecognizer.view endEditing:YES];
}
@end
