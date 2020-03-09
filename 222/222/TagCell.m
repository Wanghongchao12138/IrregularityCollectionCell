#import "TagCell.h"

@implementation TagCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
        self.layer.cornerRadius = self.bounds.size.height / 2;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = UIColor.blackColor.CGColor;
        self.layer.borderWidth = 1;
        
        [self addSubview:self.tagsLabel];
    }
    return self;
}

//- (UIButton *)tagsBtn {
//    if (!_tagsBtn) {
//        _tagsBtn = [UIButton creatNormalButton:RGBA(189, 195, 207, 1) contentAlig:UIControlContentHorizontalAlignmentCenter font:FONT(13) title:@"xxx"];
//        _tagsBtn.backgroundColor = UIColor.whiteColor;
//        _tagsBtn.frame = self.bounds;
//        [_tagsBtn setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
//    }
//    return _tagsBtn;
//}

- (UILabel *)tagsLabel {
    if (!_tagsLabel) {
        _tagsLabel = [self creatNormalLabel:UIColor.blackColor align:NSTextAlignmentCenter font:[UIFont systemFontOfSize:13] text:@"xxx"];
        _tagsLabel.backgroundColor = UIColor.whiteColor;
        _tagsLabel.frame = self.bounds;
    }
    return _tagsLabel;
}

- (UILabel  *)creatNormalLabel:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont text:(NSString *)text
{
    UILabel *commonLabel = [[UILabel alloc] init];
    
    if (textColor != nil) {
        commonLabel.textColor = textColor;
    }
    
    commonLabel.textAlignment = textAlignment;
    
    if (textFont) {
        commonLabel.font = textFont;
    }
    
    commonLabel.text = text;
    
    return commonLabel;
}

- (void)changeTagsSelect:(BOOL)isSelect {
    if (isSelect) {
        self.tagsLabel.textColor = UIColor.whiteColor;
           self.tagsLabel.backgroundColor = UIColor.orangeColor;
       }else{
           self.tagsLabel.textColor = UIColor.blackColor;
           self.tagsLabel.backgroundColor = [UIColor whiteColor];
       }
}

@end
