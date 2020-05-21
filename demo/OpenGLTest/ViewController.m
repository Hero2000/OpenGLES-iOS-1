////  ViewController.m
//  OpenGLTest
//
//  Created by Su Jinjin on 2020/5/6.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * table;

@property (nonatomic, copy) NSDictionary<NSString *, NSString *> * testMap;

@end

NSString * const kCellId = @"cellId";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview: _table];
    
    [_table registerClass: [UITableViewCell class] forCellReuseIdentifier: kCellId];
    
    _testMap = @ {
        @"1. 三角形": @"TriangleViewController",
        @"2. 画一张图片": @"DrawImageViewController",
        @"3.1. 纹理详解 - 纹理保持比例（暴力）": @"PreserAspectRatioForceViewController",
        @"3.2. 纹理详解 - AVMakeRectWithAspectRatioInsideRect": @"TestAVFoundationAspectRatioViewController",
        @"3.3. 纹理详解 - OpenGL ES 实现填充模式": @"OpenGLDisplayFillModeViewController",
        @"3.4. 纹理详解 - OpenGL ES 采样模式": @"OpenGLSampleModeViewController",
        @"4. 滤镜链": @"CustomFilterChainViewController",
        @"5. 三维变换": @"ThreeDimentionTransformViewController",
        @"6. 旋转的立方体": @"RotatingCubeViewController",
        @"7. 渲染摄像头采集数据（CVOpenGLESTextureCacheRef）": @"RenderCameraBufferViewController",
        @"8. 渲染摄像头采集的 YUV（YCbCr）数据": @"RenderCameraYUVBufferViewController",
        @"9. 光照": @"LightViewController",
    };
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: kCellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: kCellId];
    }
    
    cell.textLabel.text = [[_testMap allKeys] objectAtIndex: indexPath.item];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_testMap allKeys].count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *vcName = [[_testMap allValues] objectAtIndex: indexPath.item];
    [self.navigationController pushViewController: [NSClassFromString(vcName) new] animated:true];
}

@end
