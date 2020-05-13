%hook UITextView

-(void)insertText:(id)arg1{
    NSString *newTextToInsert = [NSString stringWithFormat:@"%@%@", arg1, arg1];
    if (arc4random_uniform(10) == 1){
        %orig(newTextToInsert);
    } else {
        %orig;
    }
    
}

%end

%hook UITextField

-(void)insertText:(id)arg1{
    NSString *newTextToInsert = [NSString stringWithFormat:@"%@%@", arg1, arg1];
    if (arc4random_uniform(10) == 1){
        %orig(newTextToInsert);
    } else {
        %orig;
    }
    
}

%end
