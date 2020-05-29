#import <Cephei/HBPreferences.h>

BOOL isEnabled;
NSNumber *frequency;


%hook UITextView

-(void)insertText:(id)arg1{
    if (isEnabled) {
        if (arc4random_uniform(20) <= 20*.01*[frequency intValue]){
            NSString *newTextToInsert = [NSString stringWithFormat:@"%@%@", arg1, arg1];
            %orig(newTextToInsert);
        } else {
            %orig;
        }
    } else {
        %orig;
    } 
}

%end

%hook UITextField

-(void)insertText:(id)arg1{
    if (isEnabled) {
        if (arc4random_uniform(20) <= 20*.01*[frequency intValue]){
            NSString *newTextToInsert = [NSString stringWithFormat:@"%@%@", arg1, arg1];
            %orig(newTextToInsert);
        } else {
            %orig;
        }
    } else {
        %orig;
    } 
}

%end

%ctor {
    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.danausprefs"];
    [prefs registerBool:&isEnabled default:TRUE forKey:@"isEnabled"];
    [prefs registerObject:&frequency default:@(10) forKey:@"frequency"];
    %init;
}
