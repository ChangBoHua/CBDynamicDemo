//
//  NSString+SimpleModifier.m
//  ManagementSystem
//
//  Created by 俊欧巴 on 17/6/6.
//  Copyright © 2017年 俊欧巴. All rights reserved.
//

#import "NSString+SimpleModifier.h"

@implementation NSString (SimpleModifier)
+ (NSMutableDictionary *)retunRichTextDic{
    NSMutableDictionary *mapper = [NSMutableDictionary new];
    mapper[@"[微笑]"] = [UIImage imageNamed:@"im_ee_1"];
    mapper[@"[撇嘴]"] = [UIImage imageNamed:@"im_ee_2"];
    mapper[@"[色]"] = [UIImage imageNamed:@"im_ee_3"];
    mapper[@"[发呆]"] = [UIImage imageNamed:@"im_ee_4"];
    mapper[@"[得意]"] = [UIImage imageNamed:@"im_ee_5"];
    mapper[@"[流泪]"] = [UIImage imageNamed:@"im_ee_6"];
    mapper[@"[害羞]"] = [UIImage imageNamed:@"im_ee_7"];
    mapper[@"[闭嘴]"] = [UIImage imageNamed:@"im_ee_8"];
    mapper[@"[睡]"] = [UIImage imageNamed:@"im_ee_9"];
    mapper[@"[大哭]"] = [UIImage imageNamed:@"im_ee_10"];
    mapper[@"[尴尬]"] = [UIImage imageNamed:@"im_ee_11"];
    mapper[@"[发怒]"] = [UIImage imageNamed:@"im_ee_12"];
    mapper[@"[调皮]"] = [UIImage imageNamed:@"im_ee_13"];
    mapper[@"[龇牙]"] = [UIImage imageNamed:@"im_ee_14"];
    mapper[@"[惊讶]"] = [UIImage imageNamed:@"im_ee_15"];
    mapper[@"[难过]"] = [UIImage imageNamed:@"im_ee_16"];
    mapper[@"[酷]"] = [UIImage imageNamed:@"im_ee_17"];
    mapper[@"[冷汗]"] = [UIImage imageNamed:@"im_ee_18"];
    mapper[@"[抓狂]"] = [UIImage imageNamed:@"im_ee_19"];
    mapper[@"[吐]"] = [UIImage imageNamed:@"im_ee_20"];
    mapper[@"[偷笑]"] = [UIImage imageNamed:@"im_ee_21"];
    mapper[@"[可爱]"] = [UIImage imageNamed:@"im_ee_22"];
    mapper[@"[白眼]"] = [UIImage imageNamed:@"im_ee_23"];
    mapper[@"[傲慢]"] = [UIImage imageNamed:@"im_ee_24"];
    mapper[@"[饥饿]"] = [UIImage imageNamed:@"im_ee_25"];
    mapper[@"[困]"] = [UIImage imageNamed:@"im_ee_26"];
    mapper[@"[惊恐]"] = [UIImage imageNamed:@"im_ee_27"];
    mapper[@"[流汗]"] = [UIImage imageNamed:@"im_ee_28"];
    mapper[@"[憨笑]"] = [UIImage imageNamed:@"im_ee_29"];
    mapper[@"[大兵]"] = [UIImage imageNamed:@"im_ee_30"];
    mapper[@"[奋斗]"] = [UIImage imageNamed:@"im_ee_31"];
    mapper[@"[咒骂]"] = [UIImage imageNamed:@"im_ee_32"];
    mapper[@"[疑问]"] = [UIImage imageNamed:@"im_ee_33"];
    mapper[@"[嘘]"] = [UIImage imageNamed:@"im_ee_34"];
    mapper[@"[晕]"] = [UIImage imageNamed:@"im_ee_35"];
    mapper[@"[折磨]"] = [UIImage imageNamed:@"im_ee_36"];
    mapper[@"[衰]"] = [UIImage imageNamed:@"im_ee_37"];
    mapper[@"[骷髅]"] = [UIImage imageNamed:@"im_ee_38"];
    mapper[@"[敲打]"] = [UIImage imageNamed:@"im_ee_39"];
    mapper[@"[再见]"] = [UIImage imageNamed:@"im_ee_40"];
    mapper[@"[擦汗]"] = [UIImage imageNamed:@"im_ee_41"];
    mapper[@"[抠鼻]"] = [UIImage imageNamed:@"im_ee_42"];
    mapper[@"[鼓掌]"] = [UIImage imageNamed:@"im_ee_43"];
    mapper[@"[糗大了]"] = [UIImage imageNamed:@"im_ee_44"];
    mapper[@"[坏笑]"] = [UIImage imageNamed:@"im_ee_45"];
    mapper[@"[左哼哼]"] = [UIImage imageNamed:@"im_ee_46"];
    mapper[@"[右哼哼]"] = [UIImage imageNamed:@"im_ee_47"];
    mapper[@"[哈欠]"] = [UIImage imageNamed:@"im_ee_48"];
    mapper[@"[鄙视]"] = [UIImage imageNamed:@"im_ee_49"];
    mapper[@"[委屈]"] = [UIImage imageNamed:@"im_ee_50"];
    mapper[@"[快哭了]"] = [UIImage imageNamed:@"im_ee_51"];
    mapper[@"[阴险]"] = [UIImage imageNamed:@"im_ee_52"];
    mapper[@"[亲亲]"] = [UIImage imageNamed:@"im_ee_53"];
    mapper[@"[吓]"] = [UIImage imageNamed:@"im_ee_54"];
    mapper[@"[可怜]"] = [UIImage imageNamed:@"im_ee_55"];
    mapper[@"[菜刀]"] = [UIImage imageNamed:@"im_ee_56"];
    mapper[@"[西瓜]"] = [UIImage imageNamed:@"im_ee_57"];
    mapper[@"[啤酒]"] = [UIImage imageNamed:@"im_ee_58"];
    mapper[@"[篮球]"] = [UIImage imageNamed:@"im_ee_59"];
    mapper[@"[乒乓]"] = [UIImage imageNamed:@"im_ee_60"];
    mapper[@"[咖啡]"] = [UIImage imageNamed:@"im_ee_61"];
    mapper[@"[饭]"] = [UIImage imageNamed:@"im_ee_62"];
    mapper[@"[猪头]"] = [UIImage imageNamed:@"im_ee_63"];
    mapper[@"[玫瑰]"] = [UIImage imageNamed:@"im_ee_64"];
    mapper[@"[凋谢]"] = [UIImage imageNamed:@"im_ee_65"];
    mapper[@"[示爱]"] = [UIImage imageNamed:@"im_ee_66"];
    mapper[@"[爱心]"] = [UIImage imageNamed:@"im_ee_67"];
    mapper[@"[心碎]"] = [UIImage imageNamed:@"im_ee_68"];
    mapper[@"[蛋糕]"] = [UIImage imageNamed:@"im_ee_69"];
    mapper[@"[闪电]"] = [UIImage imageNamed:@"im_ee_70"];
    mapper[@"[炸弹]"] = [UIImage imageNamed:@"im_ee_71"];
    mapper[@"[刀]"] = [UIImage imageNamed:@"im_ee_72"];
    mapper[@"[足球]"] = [UIImage imageNamed:@"im_ee_73"];
    mapper[@"[瓢虫]"] = [UIImage imageNamed:@"im_ee_74"];
    mapper[@"[便便]"] = [UIImage imageNamed:@"im_ee_75"];
    mapper[@"[月亮]"] = [UIImage imageNamed:@"im_ee_76"];
    mapper[@"[太阳]"] = [UIImage imageNamed:@"im_ee_77"];
    mapper[@"[礼物]"] = [UIImage imageNamed:@"im_ee_78"];
    mapper[@"[拥抱]"] = [UIImage imageNamed:@"im_ee_79"];
    mapper[@"[强]"] = [UIImage imageNamed:@"im_ee_80"];
    mapper[@"[弱]"] = [UIImage imageNamed:@"im_ee_81"];
    mapper[@"[握手]"] = [UIImage imageNamed:@"im_ee_82"];
    mapper[@"[胜利]"] = [UIImage imageNamed:@"im_ee_83"];
    mapper[@"[抱拳]"] = [UIImage imageNamed:@"im_ee_84"];
    mapper[@"[勾引]"] = [UIImage imageNamed:@"im_ee_85"];
    mapper[@"[拳头]"] = [UIImage imageNamed:@"im_ee_86"];
    mapper[@"[差劲]"] = [UIImage imageNamed:@"im_ee_87"];
    mapper[@"[爱你]"] = [UIImage imageNamed:@"im_ee_88"];
    mapper[@"[NO]"] = [UIImage imageNamed:@"im_ee_89"];
    mapper[@"[OK]"] = [UIImage imageNamed:@"im_ee_90"];
    return mapper;
}

@end
