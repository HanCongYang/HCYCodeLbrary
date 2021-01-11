//
//  ViewController.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/10.
//

#import "ViewController.h"
#import "HYKeyboardManager.h"
#import "HYLoginYBWPRequest.h"
#import <AnyPromise.h>
#import <Masonry.h>
#import "HYStackTableViewCell.h"
#import "HYTestFloatLayoutView.h"
#import <ReactiveObjC.h>
#import <QMUIKit.h>
#import "HYEdgeInsetView.h"
#import "HYTitleView.h"
#import "HYStackView.h"
#import "ThreeColumnTestView.h"
#import "HYIntroTableViewCell.h"
#import "HYIntroModel.h"
#import "IGListViewController.h"
#import "ObjcDemoViewController.h"

@interface UIView (SL)

+ (id)loadNibFromBundle:(Class)cls;

@end

@implementation UIView (SL)


+ (id)loadNibFromBundle:(Class)cls {
    
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(cls)
                                         owner:nil
                                       options:nil].lastObject;
}

@end

#define SLCreateView(cls) [UIView loadNibFromBundle:[cls class]]

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) QMUIFloatLayoutView *floatLayoutView;
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) HYStackView *stackView;
@property (nonatomic, strong) NSMutableArray *tableViewDataSources;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewDataSources = @[
     [HYIntroModel modelWithTitle:@"Collection View" detailIntro:@"Collection View统一解决方案"],
    ].mutableCopy;
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    UINib * nib =[UINib nibWithNibName:NSStringFromClass(HYIntroTableViewCell.class) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
//    self.stackView = [[HYStackView alloc] init];
//    [self.view addSubview:self.stackView];
//    ThreeColumnTestView *v = SLCreateView(ThreeColumnTestView);
//    v.detailLabel.text = @"11111111111\n11111111111\n";
//    v.titleLabel.text = @"11111111111\n11111111111\n11111111111\nnw_protocol_get_quic_image_block_invokenw_protocol_get_quic_image_block_invokenw_protocol_get_quic_image_block_invokenw_protocol_get_quic_image_block_invokenw_protocol_get_quic_image_block_invoke";
//    [self.stackView addArrangedSubview:v];
//    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view).mas_offset(UIEdgeInsetsMake(80, 20, 20, 20));
//    }];
//
//    QMUILabel *qmLabel = [[QMUILabel alloc] init];
//    qmLabel.text = @"Text";
//    qmLabel.backgroundColor = UIColor.systemPinkColor;
//    qmLabel.contentEdgeInsets = UIEdgeInsetsMake(40, 40, 40, 40);
//    [self.stackView addArrangedSubview:qmLabel];
//
//    {
//
//        UIStackView *stack = [[UIStackView alloc] init];
//
//        QMUILabel *qmLabel = [[QMUILabel alloc] init];
//        qmLabel.text = @"Label on Stack";
//        qmLabel.backgroundColor = UIColor.systemPinkColor;
//        qmLabel.contentEdgeInsets = UIEdgeInsetsMake(40, 40, 40, 40);
//        [stack addArrangedSubview:qmLabel];
//        [self.stackView addArrangedSubview:stack];
//    }
//
//    HYTitleView *t1 = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTitleView class])
//                                                    owner:nil
//                                                  options:nil].lastObject;
//
//    HYTitleView *t2 = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTitleView class])
//                                                    owner:nil
//                                                  options:nil].lastObject;
//
//    HYEdgeInsetView *inset = [[HYEdgeInsetView alloc] init];
//    inset.leading = 100;
//    [inset.stack addArrangedSubview:t1];
//    [inset.stack addArrangedSubview:t2];
//    [self.stackView addArrangedSubview:inset];
//
//    UIStackView *stack = [[UIStackView alloc] init];
//    stack.spacing = 10;
//
////    stack.distribution = UIStackViewDistributionEqualCentering;
////    stack.alignment = UIStackViewAlignmentLeading;
////    stack.axis = UILayoutConstraintAxisHorizontal;
//    QMUILabel *qmLabel1 = [[QMUILabel alloc] init];
//    stack.translatesAutoresizingMaskIntoConstraints = NO;
//
//    qmLabel1.text = @"XXX创建1";
//    [stack addArrangedSubview:qmLabel1];
//
//    QMUILabel *qmLabel2 = [[QMUILabel alloc] init];
//    qmLabel2.text = @"XXX创建2";
//    [stack addArrangedSubview:qmLabel2];
//
//    UIView *spacer = [[UIView alloc] init];
//    [spacer setContentHuggingPriority:(UILayoutPriorityDefaultLow) forAxis:(UILayoutConstraintAxisHorizontal)];
//    [stack addArrangedSubview:spacer];
//
//
//
//    [self.stackView addArrangedSubview:stack];
//
//
////    [self.view addSubview:inset];
////    [inset mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.right.mas_equalTo(self.view);
////        make.top.mas_equalTo(self.floatLayoutView.mas_bottom);
////    }];
////
//    return;
//
//
//    self.container = [[UIView alloc] init];
//    [self.view addSubview:self.container];
//
//    self.floatLayoutView = [[QMUIFloatLayoutView alloc] init];
//    self.floatLayoutView.padding = UIEdgeInsetsMake(12, 12, 12, 12);
//    self.floatLayoutView.itemMargins = UIEdgeInsetsMake(10, 10, 10, 10);
//    self.floatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
//    self.floatLayoutView.layer.borderWidth = PixelOne;
//    self.floatLayoutView.layer.borderColor = UIColorSeparator.CGColor;
//    [self.container addSubview:self.floatLayoutView];
//
//
//    NSArray<NSString *> *suggestions = @[@"东野圭吾", @"三体", @"爱", @"红楼梦",@"78881+0800 qmuide978881+0800 qmuidemo[83164:92378", @"理智与情感", @"读书热榜", @"免费榜"];
//    for (NSInteger i = 0; i < suggestions.count; i++) {
////        QMUILabel *label = [[QMUILabel alloc] init];
//////        QMUIGhostButton *button = [[QMUIGhostButton alloc] init];
////        label.textColor = UIColor.purpleColor;
////        label.text = suggestions[i];
//////        [button setTitle:suggestions[i] forState:UIControlStateNormal];
////        label.font = UIFontMake(14);
////        label.numberOfLines = 0;
////        label.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
////        [self.floatLayoutView addSubview:label];
//
//
//
//        HYTestFloatLayoutView *v =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTestFloatLayoutView class])
//                                                                  owner:nil
//                                                                options:nil].lastObject;;
//        v.detailLabel.text = suggestions[i];
//        [self.floatLayoutView addSubview:v];
//
//    }
//
//    [self.floatLayoutView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.container);
//    }];
//
//    CGSize size = [self.floatLayoutView sizeThatFits:CGSizeMake(UIScreen.mainScreen.bounds.size.width, CGFLOAT_MAX)];
//
//    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.right.left.mas_equalTo(self.view);
//        make.height.mas_greaterThanOrEqualTo(size.height);
//    }];
    
//    HYTitleView *t1 = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTitleView class])
//                                                    owner:nil
//                                                  options:nil].lastObject;
//    
//    HYTitleView *t2 = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTitleView class])
//                                                    owner:nil
//                                                  options:nil].lastObject;
//    
//    HYEdgeInsetView *inset = [[HYEdgeInsetView alloc] init];
//    inset.leading = 100;
//    [inset.stack addArrangedSubview:t1];
//    [inset.stack addArrangedSubview:t2];
//    
//    [self.view addSubview:inset];
//    [inset mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.view);
//        make.top.mas_equalTo(self.floatLayoutView.mas_bottom);
//    }];
    
//
//    [HYKeyboardManager closeAllKeyboard];
//
//    [self firstLogin].then(^(NSDictionary *json) {
//
//        return [self relogin];
//    }).then(^(NSString *string) {
//        NSLog(@"%@", string);
//        return [self checkNeedAlterView];
//    }).then(^(NSString *string) {
//        NSLog(@"hello promiseKit");
//    });
//
//    self.tableView = [[UITableView alloc] init];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    self.tableView.estimatedRowHeight = 60;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.backgroundColor = UIColor.whiteColor;
//    [self.view addSubview:self.tableView];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
//    }];
//    [self.tableView registerClass:HYStackTableViewCell.class forCellReuseIdentifier:@"cell"];
//
//    /**
//    * 元祖
//    * 快速包装一个元组
//    * 把包装的类型放在宏的参数里面,就会自动包装
//    */
//    RACTuple *tuple = RACTuplePack(@1,@2,@4);
//    // 宏的参数类型要和元祖中元素类型一致， 右边为要解析的元祖。
//    RACTupleUnpack_(NSNumber *num1, NSNumber *num2, NSNumber * num3) = tuple;// 4.元祖
//    // 快速包装一个元组
//    // 把包装的类型放在宏的参数里面,就会自动包装
//    NSLog(@"%@ %@ %@", num1, num2, num3);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewDataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HYIntroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell receive:RACTuplePack(self.tableViewDataSources[indexPath.row]) context:@"从首页进入"];
    return cell;
}

- (AnyPromise *)checkNeedAlterView {
    
    return [AnyPromise promiseWithResolverBlock:^(PMKResolver resolve){
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
                
            }];
            
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
            resolve(@"alert");

        });
    }];
}

- (AnyPromise *)firstLogin {
    
    return [AnyPromise promiseWithResolverBlock:^(PMKResolver resolve){
        
        HYLoginYBWPRequest *req = [[HYLoginYBWPRequest alloc] init];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKRequest * _Nonnull request) {
            NSLog(@"%@", request.responseJSONObject);
            resolve(request.responseJSONObject);
        } failure:^(__kindof YTKRequest * _Nonnull request) {
            
        }];
        
    }];
}


- (AnyPromise *)relogin {
    return [AnyPromise promiseWithResolverBlock:^(PMKResolver resolve){
        
        HYLoginYBWPRequest *req = [[HYLoginYBWPRequest alloc] init];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKRequest * _Nonnull request) {

            resolve(@"relogin success");
        } failure:^(__kindof YTKRequest * _Nonnull request) {
            
        }];
    }];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        ObjcDemoViewController *list = [[ObjcDemoViewController alloc] init];
        [self.navigationController pushViewController:list animated:YES];
    }
}


@end

