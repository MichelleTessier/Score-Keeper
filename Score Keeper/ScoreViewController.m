//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Douglas Goodwin on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *scoreLabels;



@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.title = @"Score Keeper";
    
    self.scoreLabels = [[NSMutableArray alloc] init];
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    // What is the difference - CGRectGetWidth(self.view.frame),(self.view.frame.size.width
    [self.view addSubview:self.scrollView];
    for (int i = 0; i < 4; i++) {
        [self addScoreView:i];
    }

}

- (void) addScoreView: (int) index {
    
    CGFloat margin = 10;
    CGFloat nameHeight = 50;
    CGFloat width = ((self.scrollView.frame.size.width) - (margin * 4)) / 4;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, index * 80, CGRectGetWidth(self.scrollView.frame), nameHeight + 30)];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, width * 2, nameHeight)];
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.placeholder = @"Type Name";
    name.delegate = self;
    [view addSubview:name];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake((2 * margin) + (2 * width), margin, width, nameHeight)];
   scoreLabel.text = @"0";
scoreLabel.textColor = [UIColor redColor];
    [view addSubview:scoreLabel];
    
    [self.scoreLabels addObject:scoreLabel];
    
    UIStepper *scoreStepper = [[UIStepper alloc] initWithFrame:CGRectMake((1 * margin) + (3 * width), margin + 10, width, nameHeight)];
    scoreStepper.minimumValue = -100;
    scoreStepper.maximumValue = 1000;
    scoreStepper.stepValue = 2;
    scoreStepper.tag = index;
    [scoreStepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
       [view addSubview:scoreStepper];
    [self.scrollView addSubview:view];
   
}

- (void) stepperValueChanged: (id) sender {
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    double value = stepper.value;
    UILabel *scoreLabel = self.scoreLabels[index];
    scoreLabel.text = [NSString stringWithFormat:@"%d", (int)value];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
