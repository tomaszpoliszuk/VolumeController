#import <Preferences/PSListController.h>

NSString *domainString = @"com.tomaszpoliszuk.volumecontroller";

@interface NSConcreteNotification : NSNotification
@end
@interface PSListController (VolumeController)
- (void)_returnKeyPressed:(NSConcreteNotification *)notification;
@end
@interface VolumeControllerMainPreferences : PSListController
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
-(void)knownIssues {
	NSURL *knownIssues = [NSURL URLWithString:@"https://github.com/tomaszpoliszuk/VolumeController/issues"];
	[[UIApplication sharedApplication] openURL:knownIssues options:@{} completionHandler:nil];
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

@interface VolumeControllerPortraitVolumeHud : PSListController
@end
@implementation VolumeControllerPortraitVolumeHud
- (void)_returnKeyPressed:(NSConcreteNotification *)notification {
	[self.view endEditing:YES];
	[super _returnKeyPressed:notification];
}
@end

@interface VolumeControllerPortraitVolumeHudCustomSize : PSListController
@end
@implementation VolumeControllerPortraitVolumeHudCustomSize
- (void)_returnKeyPressed:(NSConcreteNotification *)notification {
	[self.view endEditing:YES];
	[super _returnKeyPressed:notification];
}
@end

@interface VolumeControllerLandscapeVolumeHud : PSListController
@end
@implementation VolumeControllerLandscapeVolumeHud
- (void)_returnKeyPressed:(NSConcreteNotification *)notification {
	[self.view endEditing:YES];
	[super _returnKeyPressed:notification];
}
@end

@interface VolumeControllerLandscapeVolumeHudCustomSize : PSListController
@end
@implementation VolumeControllerLandscapeVolumeHudCustomSize
- (void)_returnKeyPressed:(NSConcreteNotification *)notification {
	[self.view endEditing:YES];
	[super _returnKeyPressed:notification];
}
@end
