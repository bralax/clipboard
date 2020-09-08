#import "RNCClipboard.h"


#import <AppKit/AppKit.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>


@implementation RCTConvert (PasteBoardType)
  RCT_ENUM_CONVERTER(NSPasteboardType,
                     (@{ @"URL" : @(NSPasteboardTypeString),
                        @"color" : @(NSPasteboardTypeColor),
                        @"NSFileContentsPboardType" : @(NSFileContentsPboardType),
                        @"NSFindPanelSearchOptionsPboardType" : @(NSFindPanelSearchOptionsPboardType),
                        @"NSPasteboardTypeHTML" : @(NSPasteboardTypeHTML),
                        @"NSPasteboardTypeMultipleTextSelection" : @(NSPasteboardTypeMultipleTextSelection),
                        @"NSPasteboardTypePDF" : @(NSPasteboardTypePDF),
                        @"NSPasteboardTypePNG" : @(NSPasteboardTypePNG),
                        @"NSPasteboardTypeRTF" : @(NSPasteboardTypeRTF),
                        @"NSPasteboardTypeRTFD" : @(NSPasteboardTypeRTFD),
                        @"NSPasteboardTypeRuler" : @(NSPasteboardTypeRuler),
                        @"NSPasteboardTypeSound" : @(NSPasteboardTypeSound),
                        @"NSPasteboardTypeString" : @(NSPasteboardTypeString),
                        @"NSPasteboardTypeTabularText" : @(NSPasteboardTypeTabularText),
                        @"NSPasteboardTypeTextFinderOptions" : @(NSPasteboardTypeTextFinderOptions),
                        @"NSPasteboardTypeTIFF" : @(NSPasteboardTypeTIFF),
                      }),
                      NSPasteboardTypeString, integerValue)
@end

@implementation RNCClipboard

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}



RCT_EXPORT_METHOD(setString:(NSString *)content)
{
  NSPasteboard *clipboard = [NSPasteboard generalPasteboard];
  [clipboard setString:content forType:NSPasteboardTypeString]
  //clipboard.string = (content ? : @"");
}

RCT_EXPORT_METHOD(getString:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
  NSPasteboard *clipboard = [NSPasteboard generalPasteboard];
  
  //resolve((clipboard.string ? : @""));
}

@end
