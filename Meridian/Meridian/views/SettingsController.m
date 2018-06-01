//
//  SettingsController.m
//  Meridian
//
//  Created by Sticktron on 2018-04-03.
//  Copyright © 2018 Ben Sparkes. All rights reserved.
//

#import "SettingsController.h"

@interface SettingsController ()
@property (weak, nonatomic) IBOutlet UISwitch *startLaunchDaemonsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *startDropbearSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *dropbearPortControl;
@property (weak, nonatomic) IBOutlet UITableViewCell *psychoTwitterCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *issueTrackerCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *sourceCodeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *websiteCell;
@end


@implementation SettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openLink:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}

- (void)openTwitter:(NSString *)user {
    NSString *url;
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]]) {
        url = [NSString stringWithFormat:@"tweetbot:///user_profile/%@", user];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]]) {
        url = [NSString stringWithFormat:@"twitterrific:///profile?screen_name=%@", user];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]]) {
        url = [NSString stringWithFormat:@"tweetings:///user?screen_name=%@", user];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]]) {
        url = [NSString stringWithFormat:@"twitter://user?screen_name=%@", user];
    } else {
        url = [NSString stringWithFormat:@"http://twitter.com/%@", user];
    }
    [self openLink:url];
}


#pragma mark - Table view

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (cell == self.psychoTwitterCell) {
        [self openTwitter:@"PsychoTea"];
        
    } else if (cell == self.websiteCell) {
        [self openLink:@"https://meridian.sparkes.zone"];
        
    } else if (cell == self.sourceCodeCell) {
        [self openLink:@"https://github.com/PsychoTea/MeridianJB"];
        
    } else if (cell == self.issueTrackerCell) {
        [self openLink:@"https://github.com/PsychoTea/MeridianJB/issues"];
    }
}


#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
