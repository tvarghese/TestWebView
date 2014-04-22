//
//  AppDelegate.m
//  TestWebView
//
//  Created by tom on 22/04/14.
//  Copyright (c) 2014 Tom. All rights reserved.
//

#import "AppDelegate.h"
#import <Quartz/Quartz.h>

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Page" withExtension:@"html"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [[self.webview mainFrame] loadRequest:req];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    if (frame != [sender mainFrame]) {
        return;
    }
    
    NSView *view = [[[self.webview mainFrame] frameView] documentView];
    NSData *data = [view dataWithPDFInsideRect:[view bounds]];
    
    NSArray* deskTopArrayPaths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSString* deskTopPath = [deskTopArrayPaths objectAtIndex:0];
    NSString* pdfPath = [NSString stringWithFormat:@"%@/SaveWebPage.pdf",deskTopPath];
	PDFDocument *doc = [[PDFDocument alloc] initWithData:data];
    [doc writeToFile:pdfPath];

}
@end
