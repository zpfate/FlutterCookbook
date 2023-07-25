//
//  ViewController.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/6/5.
//

#import "ViewController.h"
#import "XmlToFlutterConverter.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property(nonatomic, strong) NSTextField *xmlTextF;
@property(nonatomic, strong) NSTextField *codeTextF;
@property(nonatomic, strong) NSButton *convertBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"XmlToFlutterConverter";
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    // Do any additional setup after loading the view.

    self.view.translatesAutoresizingMaskIntoConstraints = false;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"xml" ofType:nil];
    
    NSString *xmlString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    
    
//    NSString *xmlString = @"<Button onClick=\"print('点击')\"><Container color=\"#FF0000\"><Text color=\"#FF0000\" font=\"14\">Hello, World!</Text></Container></Button>";
    self.xmlTextF.stringValue = xmlString;
    NSString *flutterCode = [XmlToFlutterConverter convertToFlutterCode:xmlString];
    NSLog(@"XML:\n%@", xmlString);
    NSLog(@"Flutter:\n%@", flutterCode);
    self.codeTextF.stringValue = flutterCode;
    
    [self.view addSubview:self.xmlTextF];
    [self.view addSubview:self.codeTextF];
    [self.view addSubview:self.convertBtn];

    [self.xmlTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.view);
        make.height.mas_equalTo(600);
        make.width.mas_equalTo(self.view).multipliedBy(0.5);
        make.bottom.mas_equalTo(-40);
    }];
    
    [self.codeTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(self.view);
        make.bottom.height.mas_equalTo(self.xmlTextF);
        make.width.mas_equalTo(self.view).multipliedBy(0.5);
    }];
    
    [self.convertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.xmlTextF.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
}

- (void)convert:(NSButton *)sender {
    NSString *xmlString = self.xmlTextF.stringValue;
    NSString *flutterCode = [XmlToFlutterConverter convertToFlutterCode:xmlString];
    [self.codeTextF setStringValue:flutterCode];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}
- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize {
    return frameSize;
}


#pragma mark -- Getter

- (NSTextField *)xmlTextF {
    if (!_xmlTextF) {
        _xmlTextF = [[NSTextField alloc] init];
        _xmlTextF.editable = YES;
        _xmlTextF.textColor = NSColor.whiteColor;
    }
    return _xmlTextF;
}

- (NSTextField *)codeTextF {
    if (!_codeTextF) {
        _codeTextF = [[NSTextField alloc] init];
        _codeTextF.editable = YES;
        _codeTextF.textColor = NSColor.whiteColor;
//        _codeTextF.editable = NO;
    }
    return _codeTextF;
}

- (NSButton *)convertBtn {
    if (!_convertBtn) {
        _convertBtn = [NSButton buttonWithTitle:@"Convert" target:self action:@selector(convert:)];
    }
    return _convertBtn;
}

@end
