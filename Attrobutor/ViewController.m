//
//  ViewController.m
//  Attrobutor
//
//  Created by Zaur Giyasov on 28/03/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headLine;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
    
}

- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3,
                                           NSStrokeColorAttributeName: [UIColor blueColor]}
                                   range: self.body.selectedRange];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self usePrefferedFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(prefferedFontsChanged: )
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    
}

-(void) prefferedFontsChanged: (NSNotification *) notification {
    [self usePrefferedFonts];
}

-(void) usePrefferedFonts {
    
    self.body.font = [UIFont preferredFontForTextStyle: UIFontTextStyleBody];
    self.headLine.font = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    
    [title setAttributes: @{ NSForegroundColorAttributeName: @3,
                             NSStrokeColorAttributeName: self.outlineButton.tintColor }
                   range: NSMakeRange(0, [title length])];
//    [self.outlineButton setAttributedTitle:title forState: UIControlStateNormal]; // fail!
    [self.outlineButton setAttributedTitle:title forState: UIControlStateFocused];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
