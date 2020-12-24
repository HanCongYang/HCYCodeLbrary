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

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) QMUIFloatLayoutView *floatLayoutView;
@property (nonatomic, strong) UIView *container;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.container = [[UIView alloc] init];
    [self.view addSubview:self.container];
    
    self.floatLayoutView = [[QMUIFloatLayoutView alloc] init];
    self.floatLayoutView.padding = UIEdgeInsetsMake(12, 12, 12, 12);
    self.floatLayoutView.itemMargins = UIEdgeInsetsMake(10, 10, 10, 10);
    self.floatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
    self.floatLayoutView.layer.borderWidth = PixelOne;
    self.floatLayoutView.layer.borderColor = UIColorSeparator.CGColor;
    [self.container addSubview:self.floatLayoutView];
    
    
    NSArray<NSString *> *suggestions = @[@"东野圭吾", @"三体", @"爱", @"红楼梦",@"78881+0800 qmuide978881+0800 qmuidemo[83164:92378", @"理智与情感", @"读书热榜", @"免费榜"];
    for (NSInteger i = 0; i < suggestions.count; i++) {
//        QMUILabel *label = [[QMUILabel alloc] init];
////        QMUIGhostButton *button = [[QMUIGhostButton alloc] init];
//        label.textColor = UIColor.purpleColor;
//        label.text = suggestions[i];
////        [button setTitle:suggestions[i] forState:UIControlStateNormal];
//        label.font = UIFontMake(14);
//        label.numberOfLines = 0;
//        label.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
//        [self.floatLayoutView addSubview:label];
        
       
        
        HYTestFloatLayoutView *v =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTestFloatLayoutView class])
                                                                  owner:nil
                                                                options:nil].lastObject;;
        v.detailLabel.text = suggestions[i];
        [self.floatLayoutView addSubview:v];

    }
    
    [self.floatLayoutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.container);
    }];
    
    CGSize size = [self.floatLayoutView sizeThatFits:CGSizeMake(UIScreen.mainScreen.bounds.size.width, CGFLOAT_MAX)];
    
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(self.view);
        make.height.mas_greaterThanOrEqualTo(size.height);
    }];
    
    HYTitleView *t1 = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTitleView class])
                                                    owner:nil
                                                  options:nil].lastObject;
    
    HYTitleView *t2 = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HYTitleView class])
                                                    owner:nil
                                                  options:nil].lastObject;
    
    HYEdgeInsetView *inset = [[HYEdgeInsetView alloc] init];
    [inset.stack addArrangedSubview:t1];
    [inset.stack addArrangedSubview:t2];
    
    [self.view addSubview:inset];
    [inset mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.floatLayoutView.mas_bottom);
    }];
    
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView dequeueReusableCellWithIdentifier:@"cell"];
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

//



@end
