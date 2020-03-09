
#import "EqualSpaceFlowLayout.h"

@implementation EqualSpaceFlowLayout
- (void)prepareLayout{
    [super prepareLayout];
    // 垂直滚动
    self.scrollDirection = UICollectionViewScrollDirectionVertical;

    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    for (int i = 1; i < array.count; i++){
        UICollectionViewLayoutAttributes * attribute = array[i];
        UICollectionViewLayoutAttributes * attribute2 = array[i-1];

        if (attribute.indexPath.section == attribute2.indexPath.section && attribute.frame.origin.x != 0) {
            NSInteger maximumSpacing = 10;
            NSInteger origin = CGRectGetMaxX(attribute2.frame);
            
            if (origin + maximumSpacing + attribute.frame.size.width <= self.collectionView.frame.size.width - 10) {
                CGRect frame = attribute.frame;
                frame.origin.x = origin + maximumSpacing;
                attribute.frame = frame;
            } else {
                CGRect frame = attribute.frame;
                frame.origin.x = maximumSpacing;
                frame.origin.y = CGRectGetMaxY(attribute2.frame) + maximumSpacing;
                attribute.frame = frame;

            }
            
        }
    }
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
