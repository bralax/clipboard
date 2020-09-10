#import "RNCClipboard.h"


#import <AppKit/AppKit.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTConvert.h>


@implementation RNCClipboard

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}


RCT_EXPORT_METHOD(setString:(NSString *)content)
{
  NSLog(@"%@", content);
  NSPasteboard *clipboard = [NSPasteboard generalPasteboard];
  [clipboard prepareForNewContentsWithOptions:0];
  NSLog(@"%d",[clipboard setString:content forType:NSPasteboardTypeString]);
}


RCT_EXPORT_METHOD(getString:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
  NSPasteboard *clipboard = [NSPasteboard generalPasteboard];
  NSMutableString *output = [[NSMutableString alloc] init];
  NSString *add = [clipboard stringForType:NSPasteboardTypeString];
  if (add != nil) {
    [output appendString:add];
  }
  resolve([NSString stringWithString:output]);
}

/*
 The below code would allow the ability to set the type of the contents on the
 clipboard. This code is not currently in use as the code is currently set
 up to match the already existing interface.
 RCT_EXPORT_METHOD(setStringWithType:(NSString *)content:(NSString *)type)
{
    
  NSPasteboard *clipboard = [NSPasteboard generalPasteboard];
  NSPasteboardType pType = [self PasteBoardType:type];
  NSLog(@"%@ %@ %@", content, type, pType);
    [clipboard declareTypes:[NSArray arrayWithObject:pType] owner:nil];
  NSLog(@"%d",[clipboard setString:content forType:pType]);
  //clipboard.string = (content ? : @"");
}

RCT_EXPORT_METHOD(getStringWithType:(NSString *)type:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
  NSPasteboard *clipboard = [NSPasteboard generalPasteboard];
  NSPasteboardType pType = [self PasteBoardType:type];
  resolve(( [clipboard stringForType:pType]? : @""));
}

-(NSPasteboardType)PasteBoardType:(NSString *)type
{
    NSDictionary* dict = @{ @"url" : NSPasteboardTypeString,
       @"color" : NSPasteboardTypeColor,
       @"file" : NSFileContentsPboardType,
       @"findPanel" : NSFindPanelSearchOptionsPboardType,
       @"html" : NSPasteboardTypeHTML,
       @"multipleText" : NSPasteboardTypeMultipleTextSelection,
       @"pdf" : NSPasteboardTypePDF,
       @"png" : NSPasteboardTypePNG,
       @"rtf" : NSPasteboardTypeRTF,
       @"rtfd" : NSPasteboardTypeRTFD,
       @"ruler" : NSPasteboardTypeRuler,
       @"sound" : NSPasteboardTypeSound,
       @"string" : NSPasteboardTypeString,
       @"tabularText" : NSPasteboardTypeTabularText,
       @"finder" : NSPasteboardTypeTextFinderOptions,
       @"tiff" : NSPasteboardTypeTIFF,
    };
    return dict[type];
}*/


@end
