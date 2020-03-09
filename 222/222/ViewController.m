//
/**
 * @brief  	<#usage#>
 * @author 	whc
 * @date   	2020/2/29
 */
	

#import "ViewController.h"
#import "EqualSpaceFlowLayout.h"
#import "TagCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong) NSMutableArray *tags;
@property (nonatomic ,strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    
    
    NSLog(@"%d",10002 % 10000);
    NSLog(@"%d",1 % 100);

}


- (NSMutableArray *)tags {
    if (!_tags) {
        _tags = [[NSMutableArray alloc] initWithObjects:@"萌萌哒",@"女汉子",@"选择恐惧症",@"萌萌哒",@"女汉子",@"宅",@"任性",@"biaoqian5",@"biaoqian4",@"biaoqian5",@"biaoqian4",@"biaoqian5",@"biaoqian4",@"biaoqian5",@"biaoqian4", nil];
    }
    return _tags;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        EqualSpaceFlowLayout *flowLayout = [[EqualSpaceFlowLayout alloc] init];
        flowLayout.sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = UIColor.whiteColor;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    }
    return _collectionView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.bounds.size.width, 60);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(self.view.bounds.size.width, 10);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        for (UIView *view in header.subviews) {
            [view removeFromSuperview];
        }
            UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
             headerView.backgroundColor = UIColor.whiteColor;
             UILabel *tip = [self creatNormalLabel:UIColor.blackColor align:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14] text:@""];
             if (indexPath.section == 0) {
                 tip.text = @"已选择标签";
             } else {
                 tip.text = @"标签111";
             }
             tip.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 20);
             [header addSubview:tip];
         return header;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        footer.backgroundColor = UIColor.grayColor;
        return footer;
    }
    return nil;
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


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *idenfitier = [NSString stringWithFormat:@"%ld_%ld_tagsCell", indexPath.section,indexPath.row];
    [collectionView registerClass:[TagCell class] forCellWithReuseIdentifier:idenfitier];
    TagCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:idenfitier forIndexPath:indexPath];
    cell.tagsLabel.text = self.tags[indexPath.row];
    NSArray *ary = @[@YES,@NO];
    BOOL statu = arc4random() % ary.count;
    [cell changeTagsSelect:statu];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.collectionView reloadData];
}

//必须实现
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *txt = self.tags[indexPath.row];
    CGSize size = [txt boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    return CGSizeMake(size.width + 15, 25);
}


@end
