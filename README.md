## QBIconFont  使用说明文档

### 版本

最新版本：0.0.9

新增功能：

​	icon创建方式新增2种类型，解决使用unicode语意不明确，书写困难的问题



### 使用步骤：

##### 环境配置：

1.安装YARN，使用yarn管理script 命令、脚本依赖；

2.cd 项目根目录，执行yarn install 命令

##### iconfont资源更新：

yarn parse-iconfont-json

这条命令做了以下2件事：

```
1. 将iconfont.ttf文件从font_package文件夹拷贝到project指定目录中
```

2. 解析iconfont.json文件并生成相应的objective-c代码，导入project指定目录


##### Font Class、Unicode 修改

在iconfont.cn网站项目中，Font Class可以自己修改，建议遵循小驼峰命名规范， unicode不建议修改。



### API使用

##### 方式一：

/// 使用unicodeName创建icon

/// **@param** unicodeName **<u>支持3种格式，eg：1. @"e6e7"   2. @"&#xe6e7"   3. @"\U0000e6e7"</u>**

/// **@param** size  icon大小

/// **@param** color icon形状颜色

\+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color;

##### 方式二：

/// 使用fontClassName创建icon

/// **@param** fontClassName fontClass

/// **@param** size icon大小

/// **@param** color icon形状颜色

\+ (UIImage *)iconWithFontClassName:(NSString *)fontClassName fontSize:(CGFloat)size color:(UIColor *)color;


#### 注意事项

1.不要在QBIconFontClassMapInfo.h/.m文件中增、改代码，这两个文件是脚本自动生成的，当资源更新时，手动修改的代码会被覆盖。

2.iconfont相关的文件、文件目录如无必要请不要改名、移动，避免脚本出错。
