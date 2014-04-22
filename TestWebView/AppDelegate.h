//
//  AppDelegate.h
//  TestWebView
//
//  Created by tom on 22/04/14.
//  Copyright (c) 2014 Tom. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *webview;

@end
