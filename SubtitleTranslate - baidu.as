/*
    real time subtitle translate for PotPlayer using Bai Du API
*/

// string GetTitle()                                                         -> get title for UI
// string GetVersion                                                        -> get version for manage
// string GetDesc()                                                            -> get detail information
// string Translate(string Text, string &in SrcLang, string &in DstLang)     -> do translate !!


//必须配置的部分，申请地址：https://fanyi-api.baidu.com/
string appId = "";//appid
string toKen = "";//密钥

string userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36";//这个是可选配置，一般不用修改！

/**
 * 获取当前插件的版本号
 */
string GetVersion(){
    return "1.1";
}

/**
 * 获取当前插件的标题
 */
string GetTitle(){
    return "{$CP0=Baidu翻译，修改原始语言后需要重启播放器生效$}";
}


/**
 * 获取当前插件的表述信息
 */
string GetDesc(){
    return "https://fanyi.baidu.com/";
}


/**
 * 获取支持的语言列表 - 源语言
 */
array<string> GetSrcLangs(){
    return {"auto", "en", "jp", "kor"};
}

/**
 * 获取支持的语言列表 - 目标语言
 */
array<string> GetDstLangs(){
    return {"zh"};
}


/**
 *  开发文档。需要App id 等信息
 *  http://api.fanyi.baidu.com/api/trans/product/apidoc
 *
 * 翻译的入口
 * @param text 待翻译的原文
 * @param srcLang 当前语言
 * @param dstLang 目标语言
 */
string Translate(string text, string &in srcLang, string &in dstLang){
    if(text.empty()){
        return text;
    }
    //语言选择
    if(srcLang.empty()){
        srcLang = "auto";
    }

    dstLang = "zh";

    //构建请求的 url 地址
    string salt = "" + HostGetTickCount();//随机数
    string sign = HostHashMD5(appId + text + salt + toKen);//签名 appid+q+salt+密钥

    //对原文进行 url 编码
    string q = HostUrlEncode(text);

    string parames = "from=" + srcLang + "&to=" + dstLang + "&appid=" + appId + "&sign=" + sign  + "&salt=" + salt + "&q=" + q;
    string url = "http://api.fanyi.baidu.com/api/trans/vip/translate?" + parames;

    //请求翻译
    string html = HostUrlGetString(url, userAgent);

    //解析翻译结果
    string ret = "";
    if(!html.empty()){
        ret = JsonParse(html);
    }

    //如果有翻译结果
    if(ret.length() > 0){
        srcLang = "UTF8";
        dstLang = "UTF8";
    }

    return ret;
}

/**
 * 解析Json数据
 * @param json 服务器返回的Json字符串
 */
string JsonParse(string json){
    //返回值
    string ret = "";
    JsonReader reader;
    JsonValue root;

    //如果成功解析了json内容
    if (reader.parse(json, root)){
        //要求是对象模式
        if(root.isObject()){
            //获取json root对象中所有的key
            array<string> keys = root.getKeys();
            //查找是否存在错误
            if(hasErrorInResult(keys)){
                JsonValue errorCode = root["error_code"];
                JsonValue errorMsg = root["error_msg"];
                ret = "error: " + errorCode.asString() + ", error_msg=" + errorMsg.asString();
            }else{
                JsonValue transResult = root["trans_result"];
                if(transResult.isArray()){
                    //取得翻译结果
                    for(int i = 0; i < transResult.size(); i++){
                        JsonValue item = transResult[i];
                        JsonValue dst = item["dst"];
                        if(i > 0){
                            ret += "\n";
                        }
                        ret += dst.asString();
                    }
                }
            }
        }
    }
    return ret;
}

/**
 * 检查翻译结果返回值中是否存在错误
 * @param keys json root 层的 key 列表
 */
bool hasErrorInResult(array<string> keys){
    for(uint i = 0; i < keys.size(); i++){
        if("error_code" == keys[i]){
            return true;
        }
    }
    return false;
}
