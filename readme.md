不知为何，我使用原版插件 (https://github.com/fjqingyou/PotPlayer_Subtitle_Translate_Baidu) 会造成播放器卡死，索性删除了一些没必要的代码。

# 声明：
>1、这个是机器翻译。所以翻译效果肯定不是太好，不要抱太高的期望！
>
>2、百度翻译在2百万字符，就要收费，所以没法用我个人的AppId和密钥，需要您自己注册一个。
>
>3、如果是一个人用，个人使用一个月看视频的字幕翻译而已，不至于到2百万字符吧。。。。嗯。大概。建议您可以自己每隔几天去百度翻译后台看看。
>
>4、我个人使用的环境是：不带字幕的视频+ass外挂字幕+在线翻译这样的结构。推荐也是用这个模式，内嵌字幕可能是硬绘制在视频帧图片里面，那种情况的视频暂时没法翻译。建议先找一个这种格式的，测试集成效果！
>
>5、我只是源码开源者，只为技术交流，拒绝承担任何责任！
----

## 第一步：必须开通百度翻译的开发者，并注册一个应用

>1、前往网址：http://api.fanyi.baidu.com/api/trans/product/prodinfo
>
>2、登录你自己的百度账号
>
>3、第1的网址打开后点“产品服务”，拉到下面，有个“立即使用”
>
>4、填写百度翻译要求的必要信息，并完成应用注册，不要填写IP地址，其他的填写啥看你个人喜好咯！
----

## 第二步：安装翻译插件

>1、将SubtitleTranslate - baidu.as、SubtitleTranslate - baidu.ico这两个文件选中，Ctrl+C复制
>
>2、打开PotPlayer播放器的安装路径（方法不会的请百度、谷歌等等方式搜索）
>
>3、再进入Extention文件夹，接着又进入Subtitle文件夹、最后进入Translate文件夹
>
>4、Ctrl+V，把刚才选择的两个文件粘贴到这个文件夹
----

## 第三步：获取和配置翻译插件的 appId 与 密钥

>1、第一步中的1，网址，点击“管理控制台”
>
>2、我的服务下面一点，如果有“此服务已停用 开启（这两个字蓝色）”的提示，点击“开启”
>
>3、拉到底部，会有“申请信息”，里面包含 “APP ID” 和 “密钥”
>
>4、随便打开一个带外挂字幕的视频，例如外挂ass字幕文件的视频！
>
>5、**用记事本打开**Translate文件夹中的.as文件，把AppId和密钥都填进去。
----

## 第四步：测试

>1、随便打开一个带中文字幕的视频（如果上方打开的视频没关闭，不必重新打开）
>
>2、右键点击视频->字幕->在线字幕翻译->Bai Du translate
>
>3、右键点击视频->字幕->在线字幕翻译->总是使用(注：这个看个人需求)
>
>4、右键点击视频->字幕->在线字幕翻译->下面显示翻译(注：这个看个人需求)
>
>5、右键点击视频->字幕->在线字幕翻译->目标语言->之后在语言列表选择你要的，例如英语，日语、汉语等等任意一个，看个人需求。
>
>6、畅玩吧
----

