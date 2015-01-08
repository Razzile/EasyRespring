
@interface SpringBoard : NSObject // makeshift springboard class
- (void)_relaunchSpringBoardNow;
@end

@interface SBDisplayItem : NSObject //makeshift SBDisplayItem class
@property(readonly, assign, nonatomic) NSString* displayIdentifier;
@end

%hook SBAppSwitcherController

// Allow the SpringBoard display item to be removed (swiped up)
-(BOOL)switcherScroller:(id)scroller isDisplayItemRemovable:(id)removable {
	return YES;
}

// hook the method that handles the removal of a display item
-(void)switcherScroller:(id)scroller displayItemWantsToBeRemoved:(SBDisplayItem*)beRemoved {
	if ([beRemoved.displayIdentifier isEqualToString:@"com.apple.springboard"]) { // springboard has been removed, respring the device
		[(SpringBoard *)[UIApplication sharedApplication] _relaunchSpringBoardNow];
	}
	return %orig; // without this, no apps actually get killed
}

%end