//
/**
 * @brief
 * @author 	whc
 * @date   	2020/2/26
 */
	

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TagCell : UICollectionViewCell
@property (nonatomic ,strong) UILabel *tagsLabel;
@property (nonatomic ,copy) NSString *color;
- (void)changeTagsSelect:(BOOL)isSelect;

@end

NS_ASSUME_NONNULL_END
