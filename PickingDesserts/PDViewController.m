//
//  PDViewController.m
//  PickingDesserts
//
//  Created by Ben Norris on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"

@interface PDViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation PDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 300, 0, 0)];
    pickerView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin);
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    [self.view addSubview:pickerView];
    [self pickerView:pickerView didSelectRow:0 inComponent:0];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [self data].count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[self data][component] count ];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.data[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *titleString = self.data[0][[pickerView selectedRowInComponent:0]];
    for (int i=1; i<[self numberOfComponentsInPickerView:pickerView]; i++) {
        titleString = [titleString stringByAppendingString:[NSString stringWithFormat:@" %@",self.data[i][[pickerView selectedRowInComponent:i]]]];
    }
    switch ([pickerView selectedRowInComponent:0]) {
        case 0:
            self.view.backgroundColor = [UIColor yellowColor];
            [self.navigationController.navigationBar setBarTintColor:[UIColor yellowColor]];
            break;
            
        case 1:
            self.view.backgroundColor = [UIColor orangeColor];
            [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
            break;
            
        case 2:
            self.view.backgroundColor = [UIColor redColor];
            [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
            break;
            
        default:
            break;
    }
    self.title = titleString;
}

#pragma mark = Picker View Data Arrays

- (NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {
    
    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
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
