# BaiduApis

BaiduAPiStore的ruby wrapper，[http://apistore.baidu.com/](http://apistore.baidu.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baidu_apis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baidu_apis

## Usage

```ruby
require 'baidu_apis'
```

#### 设置api_key
```ruby
BaiduApis.api_key = "blabla"
```

#### 常规api请求 
```ruby
BaiduApis::Operation.get("apistore/weatherservice/weather") do |params|
  params["citypinyin"] = "shanghai"      
end  
=> {"errNum"=>0,
 "errMsg"=>"success",
 "retData"=>
  {"city"=>"上海",
   "pinyin"=>"shanghai",
   "citycode"=>"101020100",
   "date"=>"16-04-15",
   "time"=>"11:00",
   "postCode"=>"200000",
   "longitude"=>121.445,
   "latitude"=>31.213,
   "altitude"=>"19",
   "weather"=>"多云",
...
```
- 目前仅支持get/post方法
- url写在参数里，也可以是"apistore", "weatherservice", "weather"这样的形式
- block里写request参数

#### 使用helper方法
```ruby
BaiduApis.iplookup("ip" => "8.8.8.8")
=> {"errNum"=>0,
 "errMsg"=>"success",
 "retData"=>{"ip"=>"8.8.8.8", "country"=>"美国", "province"=>"None", "city"=>"None", "district"=>"None", "carrier"=>"未知"}}
```

#### 注册一个helper方法
```ruby
BaiduApis::Helper.register_helper(:pm, {method: "get", url: "apistore/aqiservice/aqi"})
BaiduApis.pm("city" => "上海")
=> {"errNum"=>0, "retMsg"=>"success", "retData"=>{"city"=>"上海", "time"=>"2016-04-15T14:00:00Z", "aqi"=>77, "level"=>"良", "core"=>"颗粒物(PM10)"}}
```

#### 设定param_key
```ruby
BaiduApis::Helper.register_helper(:pm, {method: "get", url: "apistore/aqiservice/aqi", param_key: "city"})
BaiduApis.pm("上海")
=> {"errNum"=>0, "retMsg"=>"success", "retData"=>{"city"=>"上海", "time"=>"2016-04-15T14:00:00Z", "aqi"=>77, "level"=>"良", "core"=>"颗粒物(PM10)"}}
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

