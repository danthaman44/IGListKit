/**
 Copyright (c) Facebook, Inc. and its affiliates.
 
 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "InteractiveCell.h"

@interface InteractiveCell () <UITextFieldDelegate>
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) CALayer *separator;
@property (nonatomic, strong) UITextField *commentTextField;
@property (nonatomic, strong) UITextField *accessoryTextField;

@end

@implementation InteractiveCell

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UIColor *buttonTitleColor = [UIColor colorWithRed:28/255.0 green:30/255.0 blue:28/255.0 alpha:1.0];
    UIFont *titleFont = [UIFont systemFontOfSize:12.0];
    
    self.likeButton = [[UIButton alloc] init];
    [self.likeButton setTitle:@"Like" forState:UIControlStateNormal];
    [self.likeButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    [self.likeButton.titleLabel setFont:titleFont];
    [self.likeButton sizeToFit];
    [self.contentView addSubview:self.likeButton];
    
    self.commentButton = [[UIButton alloc] init];
    [self.commentButton setTitle:@"Comment" forState:UIControlStateNormal];
    [self.commentButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    [self.commentButton.titleLabel setFont:titleFont];
    [self.commentButton sizeToFit];
    [self.contentView addSubview:self.commentButton];
    
    self.shareButton = [[UIButton alloc] init];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [self.shareButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    [self.shareButton.titleLabel setFont:titleFont];
    [self.shareButton sizeToFit];
    [self.contentView addSubview:self.shareButton];

    self.commentTextField = [[UITextField alloc] init];
    [self.commentTextField setPlaceholder:@"Add a comment..."];
    [self.commentTextField setBorderStyle: UITextBorderStyleRoundedRect];
    [self.contentView addSubview:self.commentTextField];

    self.accessoryTextField = [[UITextField alloc] init];
    [self.accessoryTextField setPlaceholder:@"Add a comment..."];
    [self.accessoryTextField setBorderStyle: UITextBorderStyleRoundedRect];
    [self.commentTextField setInputAccessoryView:self.accessoryTextField];
    self.commentTextField.delegate = self;
    self.accessoryTextField.delegate = self;

    self.separator = [[CALayer alloc] init];
    self.separator.backgroundColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1].CGColor;
    [self.contentView.layer addSublayer:self.separator];
    [self setupGestureRecognizers];

}

- (void)setupGestureRecognizers {
    SEL selector = @selector(dismissKeyboard:);
    UIGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    [self.contentView addGestureRecognizer:recognizer];
}

- (void)dismissKeyboard:(UITapGestureRecognizer*)recognizer {
    [self.commentTextField resignFirstResponder];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    CGFloat leftPadding = 8.0;
    CGFloat buttonHeight = 24.0;
    self.likeButton.frame = CGRectMake(leftPadding, 0, CGRectGetWidth(self.likeButton.frame), buttonHeight);
    
    self.commentButton.frame = CGRectMake(leftPadding + CGRectGetMaxX(self.likeButton.frame), 0, CGRectGetWidth(self.commentButton.frame), buttonHeight);
    
    self.shareButton.frame = CGRectMake(leftPadding + CGRectGetMaxX(self.commentButton.frame), 0, CGRectGetWidth(self.shareButton.frame), buttonHeight);

    CGFloat textFieldHeight = 35.0;
    CGFloat spacing = 6.0;
    self.commentTextField.frame = CGRectMake(leftPadding, bounds.size.height - textFieldHeight - spacing, bounds.size.width - leftPadding, textFieldHeight);

    self.accessoryTextField.frame = CGRectMake(0, 0, bounds.size.width, textFieldHeight);
    
    CGFloat height = 0.5;
    self.separator.frame = CGRectMake(leftPadding, bounds.size.height - height, bounds.size.width - leftPadding, height);
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.commentTextField resignFirstResponder];
    return true;
}



@end
