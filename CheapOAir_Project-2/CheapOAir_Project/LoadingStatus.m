/*
     File: LoadingStatus.m
 Abstract: View for displaying the loading status.
  Version: 1.1
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 
 */

#import "LoadingStatus.h"

@interface LoadingStatus ()

@property (nonatomic, strong) UIActivityIndicatorView *progress;
@property (nonatomic, strong) UILabel *loadingLabel;

@end


#pragma mark -

@implementation LoadingStatus

+ (id)defaultLoadingStatusWithWidth:(CGFloat)width {
    //return [[LoadingStatus alloc] init];
   return [[LoadingStatus alloc] initWithFrame:CGRectMake(0.0, 0.0, width, 520.0)];
}

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
       
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
        
        // self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4f];
        
        NSString *loadingString = @"Loading Flights Details…";

        UIFont *loadingFont = [UIFont boldSystemFontOfSize:20.0f];
       // UIColor *color = [UIColor colorWithCIColor:];
        NSDictionary *attrs = @{NSFontAttributeName:loadingFont};
        
        CGRect rect = [loadingString boundingRectWithSize:CGSizeMake(CGRectGetWidth(frame), CGRectGetHeight(frame))
                                         options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                      attributes:attrs
                                         context:nil];
        CGSize labelSize = rect.size;
        
        CGFloat centerX = floor((CGRectGetWidth(frame) / 2.0f) - (labelSize.width / 2.0f));
        CGFloat centerY = floor((CGRectGetHeight(frame) / 2.0f) - (labelSize.height / 2.0f));
        _loadingLabel = [[UILabel alloc] initWithFrame: CGRectMake(centerX, centerY, labelSize.width, labelSize.height)];
        self.loadingLabel.backgroundColor = [UIColor clearColor];
        self.loadingLabel.textColor = [UIColor blackColor];
        self.loadingLabel.text = loadingString;
        self.loadingLabel.font = loadingFont;
        
        _progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        CGRect progressFrame = self.progress.frame;
        progressFrame.origin.x = centerX - CGRectGetWidth(progressFrame) - 8.0f;
        progressFrame.origin.y = centerY;
        self.progress.frame = progressFrame;
        
        [self addSubview:self.progress];
        [self addSubview:self.loadingLabel];
        
    }
    return self;
}

- (void)willRemoveSubview:(UIView *)subview {
    
    if (subview == self.progress)
        [self.progress stopAnimating];
    
    [super willRemoveSubview:subview];
}

- (void)didMoveToWindow {
    
    [super didMoveToWindow];
    
    [self.progress startAnimating];
}

- (void)removeFromSuperviewWithFade {
    
    [UIView animateWithDuration:0.3f animations:^(void) {
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

@end
