#line 1 "Tweak.x"
#import <Cephei/HBPreferences.h>

BOOL isEnabled;
NSNumber *frequency;



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UITextField; @class UITextView; 
static void (*_logos_orig$_ungrouped$UITextView$insertText$)(_LOGOS_SELF_TYPE_NORMAL UITextView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UITextView$insertText$(_LOGOS_SELF_TYPE_NORMAL UITextView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$UITextField$insertText$)(_LOGOS_SELF_TYPE_NORMAL UITextField* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UITextField$insertText$(_LOGOS_SELF_TYPE_NORMAL UITextField* _LOGOS_SELF_CONST, SEL, id); 

#line 7 "Tweak.x"


static void _logos_method$_ungrouped$UITextView$insertText$(_LOGOS_SELF_TYPE_NORMAL UITextView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    if (isEnabled) {
        if (arc4random_uniform(20) <= 20*.01*[frequency intValue]){
            NSString *newTextToInsert = [NSString stringWithFormat:@"%@%@", arg1, arg1];
            _logos_orig$_ungrouped$UITextView$insertText$(self, _cmd, newTextToInsert);
        } else {
            _logos_orig$_ungrouped$UITextView$insertText$(self, _cmd, arg1);
        }
    } else {
        _logos_orig$_ungrouped$UITextView$insertText$(self, _cmd, arg1);
    } 
}





static void _logos_method$_ungrouped$UITextField$insertText$(_LOGOS_SELF_TYPE_NORMAL UITextField* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    if (isEnabled) {
        if (arc4random_uniform(20) <= 20*.01*[frequency intValue]){
            NSString *newTextToInsert = [NSString stringWithFormat:@"%@%@", arg1, arg1];
            _logos_orig$_ungrouped$UITextField$insertText$(self, _cmd, newTextToInsert);
        } else {
            _logos_orig$_ungrouped$UITextField$insertText$(self, _cmd, arg1);
        }
    } else {
        _logos_orig$_ungrouped$UITextField$insertText$(self, _cmd, arg1);
    } 
}



static __attribute__((constructor)) void _logosLocalCtor_0f530806(int __unused argc, char __unused **argv, char __unused **envp) {
    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.danausprefs"];
    [prefs registerBool:&isEnabled default:TRUE forKey:@"isEnabled"];
    [prefs registerObject:&frequency default:@(10) forKey:@"frequency"];
    {Class _logos_class$_ungrouped$UITextView = objc_getClass("UITextView"); MSHookMessageEx(_logos_class$_ungrouped$UITextView, @selector(insertText:), (IMP)&_logos_method$_ungrouped$UITextView$insertText$, (IMP*)&_logos_orig$_ungrouped$UITextView$insertText$);Class _logos_class$_ungrouped$UITextField = objc_getClass("UITextField"); MSHookMessageEx(_logos_class$_ungrouped$UITextField, @selector(insertText:), (IMP)&_logos_method$_ungrouped$UITextField$insertText$, (IMP*)&_logos_orig$_ungrouped$UITextField$insertText$);}
}
