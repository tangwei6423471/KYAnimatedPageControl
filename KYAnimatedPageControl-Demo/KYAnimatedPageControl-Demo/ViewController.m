//
//  ViewController.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/9/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "KYAnimatedPageControl.h"
#import "DemoCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)KYAnimatedPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *demoCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageControl = [[KYAnimatedPageControl alloc]initWithFrame:CGRectMake(20, 500, 280, 20)];
    self.pageControl.pageCount = 6;
    self.pageControl.unSelectedColor = [UIColor colorWithRed:0.596 green:0.596 blue:0.604 alpha:1.000];
    self.pageControl.selectedColor = [UIColor colorWithRed:0.725 green:0.808 blue:0.000 alpha:1.000];
    self.pageControl.bindScrollView = self.demoCollectionView;

//    ((UIScrollView *)self.demoCollectionView).delegate = self.pageControl.bindScrollViewDelegate;
    [self.pageControl addDelegate:self];
    self.pageControl.shouldShowProgressLine = YES;
    
    self.pageControl.indicatorStyle = IndicatorStyleGooeyCircle;
    self.pageControl.indicatorSize = 14;
    self.pageControl.swipeEnable = YES;
    [self.view addSubview:self.pageControl];
    
    self.pageControl.didSelectIndexBlock = ^(NSInteger index){
        NSLog(@"Did Selected index : %ld",(long)index);
    };

    
}

#pragma mark  -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.pageControl.pageCount;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    DemoCell *democell = (DemoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"democell" forIndexPath:indexPath];
    democell.cellNumLabel.text = [NSString stringWithFormat:@"%d",indexPath.item + 1];
    
    return democell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectItemAtIndexPath");
}

#pragma mark - Action

- (IBAction)animateToForthPage:(id)sender
{
    [self.pageControl animateToIndex:3];
}

- (IBAction)swipeEnableChanged:(UISwitch *)sender
{
    self.pageControl.swipeEnable = sender.isOn;
}






@end
