/* Volume Controller - Control Volume on iOS/iPadOS
 * Copyright (C) 2020 Tomasz Poliszuk
 *
 * Volume Controller is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License.
 *
 * Volume Controller is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Volume Controller. If not, see <https://www.gnu.org/licenses/>.
 */


#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>

NSString *const domainString = @"com.tomaszpoliszuk.volumecontroller";

@interface NSConcreteNotification : NSNotification
@end
@interface PSListController (VolumeController)
@end
@interface VolumeControllerMainSettings : PSListController {
	NSMutableArray *removeSpecifiers;
}
@end
@implementation VolumeControllerMainSettings
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}
- (void)loadView {
	[super loadView];
	((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
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
-(void)TomaszPoliszukAtBigBoss {
	UIApplication *application = [UIApplication sharedApplication];
	NSString *tweakName = @"Volume+Controller";
	NSURL *twitterWebsite = [NSURL URLWithString:[@"http://apt.thebigboss.org/developer-packages.php?name=" stringByAppendingString:tweakName]];
	[application openURL:twitterWebsite options:@{} completionHandler:nil];
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
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"PortraitVolumeHud" target:self];
	}
	return _specifiers;
}
- (void)loadView {
	[super loadView];
	((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}
@end

@interface VolumeControllerPortraitVolumeHudCustomSize : PSListController
@end
@implementation VolumeControllerPortraitVolumeHudCustomSize
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"PortraitVolumeHudCustomSize" target:self];
	}
	return _specifiers;
}
- (void)loadView {
	[super loadView];
	((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}
@end

@interface VolumeControllerLandscapeVolumeHud : PSListController
@end
@implementation VolumeControllerLandscapeVolumeHud
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"LandscapeVolumeHud" target:self];
	}
	return _specifiers;
}
- (void)loadView {
	[super loadView];
	((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}
@end

@interface VolumeControllerLandscapeVolumeHudCustomSize : PSListController
@end
@implementation VolumeControllerLandscapeVolumeHudCustomSize
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"LandscapeVolumeHudCustomSize" target:self];
	}
	return _specifiers;
}
- (void)loadView {
	[super loadView];
	((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}
@end
