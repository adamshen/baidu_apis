require_relative 'test_helper'

class HelperTest < Minitest::Test
  def setup
    BaiduApis.api_key = YAML.load_file("test.yml")["api_key"]
  end

  def test_helper
    result = BaiduApis.iplookup("8.8.8.8")
    assert_equal "美国", result.dig("retData", "country")

    result = BaiduApis.iplookup("ip" => "8.8.8.8")
    assert_equal "美国", result.dig("retData", "country")
  end

  def test_add_helper
    BaiduApis::Helper.class_eval do
      class << self
        define_method :weixin_article do
          {
              method: "get",
              url: "txapi/weixin/wxhot"
          }
        end
      end
    end

    result = BaiduApis.weixin_article("num" => 10)
    assert_equal "success", result.fetch("msg")
  end


  def test_register_helper
    BaiduApis::Helper.register_helper(:pm, {method: "get", url: "apistore/aqiservice/aqi"})

    result = BaiduApis.pm("city" => "上海")
    assert_equal "success", result.fetch("retMsg")
  end
end