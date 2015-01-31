
#pragma mark - Forward declarations

@interface SpringBoard : NSObject
- (void)_relaunchSpringBoardNow;
@end

@interface SBDisplayItem : NSObject
@property(readonly, assign, nonatomic) NSString* displayIdentifier;
@end

#pragma mark - Hooks

%hook SBAppSwitcherController

// Allow the SpringBoard display item to be removed (swiped up)
-(BOOL)switcherScroller:(id)scroller isDisplayItemRemovable:(id)removable {
	return YES;
}

// hook the method that handles the removal of a display item
-(void)switcherScroller:(id)scroller displayItemWantsToBeRemoved:(SBDisplayItem*)beRemoved {
	if ([beRemoved.displayIdentifier isEqualToString:@"com.apple.springboard"]) { 
		// springboard has been removed, respring the device
		[(SpringBoard *)[UIApplication sharedApplication] _relaunchSpringBoardNow];
		break;
	}
	%orig; //to kill other apps
}

%end
