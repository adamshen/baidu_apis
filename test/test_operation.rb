require_relative 'test_helper'

class OperationTest < Minitest::Test
  def setup
    BaiduApis.api_key = YAML.load_file("test.yml")["api_key"]
  end

  def test_weather
    result = BaiduApis::Operation.get("apistore/weatherservice/weather") do |params|
      params["citypinyin"] = "shanghai"
    end

    assert_equal "success", result["errMsg"]
  end

  def test_ip
    result = BaiduApis::Operation.get("apistore", "iplookupservice", "iplookup") do |params|
      params["ip"] = "8.8.8.8"
    end

    assert_equal "success", result["errMsg"]
  end

  def test_phone_number
    result = BaiduApis::Operation.get("apistore", "mobilenumber", "mobilenumber") do |params|
      params["phone"] = "15210013578"
    end

    assert_equal "北京", result.dig("retData", "city")
  end
end
