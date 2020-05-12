@interface UIKeyboardLayoutStar
-(void)touchUp:(id)arg1 executionContext:(id)arg2;
@end

@interface UIKeyboardTaskQueue : NSObject
@end

@interface UIKeyboardTaskExecutionContext : NSObject
-(UIKeyboardTaskQueue *)executionQueue;
-(id)initWithExecutionQueue:(id)arg1;
@end


%hook UIKeyboardLayoutStar

-(void)touchUp:(id)arg1 executionContext:(UIKeyboardTaskExecutionContext *)arg2{
	NSLog(@"DANAUS TESTING: %@", [arg2 executionQueue]);
	%orig;
	UIKeyboardTaskExecutionContext *newContext = [[%c(UIKeyboardTaskExecutionContext) alloc] initWithExecutionQueue:[arg2 executionQueue]];
	%orig(arg1, newContext);
}

%end
