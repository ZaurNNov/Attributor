//
//  TextStatsViewController.m
//  Attrobutor
//
//  Created by Zaur Giyasov on 30/03/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactesrLabel;

@end

@implementation TextStatsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //test
//    self.textToAnalyze = [[NSAttributedString alloc] initWithString: @"test" attributes:@{NSForegroundColorAttributeName: [UIColor greenColor], NSStrokeWidthAttributeName: @3}];
}

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self updateUI];
}

-(void) updateUI
{
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters", (unsigned long)[[self charactesWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactesrLabel.text = [NSString stringWithFormat:@"%lu outlined characters", (unsigned long)[[self charactesWithAttribute:NSStrokeWidthAttributeName] length]];
    
}

-(NSAttributedString *) charactesWithAttribute: (NSString *) attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    
    int index = 0;
    
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName  atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else {
            index ++;
        }
    }
    
    return characters;
}


@end
