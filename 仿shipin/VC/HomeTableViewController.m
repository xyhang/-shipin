//
//  HomeTableViewController.m
//  仿shipin
//
//  Created by yan on 16/4/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "HomeTableViewController.h"
#import "UIButton+WebCache.h"
#import "RootTableViewCell.h"
#import "FMGAVPlayer/FMGVideoPlayView.h"
#import "FMGAVPlayer/FullView.h"
@interface HomeTableViewController ()<FMGVideoPlayViewDelegate>
{
    NSArray *headArray;
    NSMutableArray *dataArray;
}

@property (nonatomic, strong) FMGVideoPlayView * fmVideoPlayer; // 播放器

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [NSMutableArray array ];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self createPlayer];
    [self requestData];
}
#pragma mark - 创建播放器
-(void)createPlayer{
    _fmVideoPlayer = [FMGVideoPlayView videoPlayView];
    _fmVideoPlayer.delegate = self;
}
#pragma mark - 数据请求
-(void)requestData{
    HttpRequestTool *tool = [HttpRequestTool shareHttpTool];
    [tool getRequestWithUrl:homeURL Sucess:^(NSArray *videoListArray, NSArray *videoSidListArray) {
        headArray = videoSidListArray;
        NSLog(@"%@",headArray);
        [self loadVideoListData:videoListArray];
        [self createHeadView];
    } error:^(NSError *error) {
        
    }];
}

#pragma mark - 处理列表数据
-(void)loadVideoListData:(NSArray *)videoListArray{
    for (VideoListModel *model in videoListArray) {
        [dataArray addObject:model];
        NSLog(@"%@",dataArray);
    }
    [self.tableView reloadData];
}

#pragma mark - 处理顶部shitu
-(void)createHeadView{
    UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 60)];
    
    CGFloat tempW = (kWidth-200)/4;
    
    for (int i = 0; i<4; i++) {
        VideoSidListModel *model = headArray[i];
        NSURL *url = [NSURL URLWithString:model.imgsrc];
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(40+(40+tempW)*i, 10, 40, 40);
        [btn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i+100;
        [btn sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:nil];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40+(40+tempW)*i, 50, 40, 20)];
        label.text = model.title;
        [headV addSubview:btn];
        [headV addSubview:label];
    }
    self.tableView.tableHeaderView = headV;
}
#pragma mark - 顶部btn跳转
-(void)headBtnClick:(UIButton *)btn{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return dataArray.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 275;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RootTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[RootTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.video = dataArray[indexPath.row];
    [cell.playButton addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.playButton.tag = 10+indexPath.row;
    
    return cell;
}

#pragma mark - 播fang
-(void)playClick:(UIButton *)btn{
    VideoListModel *model = dataArray[btn.tag-10];
    [_fmVideoPlayer setUrlString:model.mp4_url];
    _fmVideoPlayer.frame = CGRectMake(0, 275*(btn.tag - 10) + kWidth/5 + 35  , kWidth, (self.view.frame.size.width-20)/2);
    _fmVideoPlayer.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_fmVideoPlayer];
    _fmVideoPlayer.contrainerViewController = self;
    [_fmVideoPlayer.player play];
    [_fmVideoPlayer showToolView:NO];
    _fmVideoPlayer.playOrPauseBtn.selected = YES;
    _fmVideoPlayer.hidden = NO;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
