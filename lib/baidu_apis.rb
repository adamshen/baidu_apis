require "json"
require "faraday"

require_relative "baidu_apis/version"
require_relative "baidu_apis/operation"
require_relative "baidu_apis/helper"

module BaiduApis
  class << self
    attr_accessor :api_key

    def method_missing(method_id, *args, &block)
      if BaiduApis::Helper.respond_to?(method_id)
        config = BaiduApis::Helper.send(method_id)

        params = get_params(config, args)
        response = BaiduApis::Operation.req(config[:method], config[:url], params)
        return JSON.parse(response.body)
      end

      super
    end

    private
    def get_params(config, args)
      return args.first if args.first.is_a?(Hash)
      {config[:param_key] => args.first}
    end
  end
end