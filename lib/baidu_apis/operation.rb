module BaiduApis
  class Operation
    API_URL = "http://apis.baidu.com/"

    class << self
      def req(method_name, url, params)
        url_path = url.is_a?(Array) ? url.join('/') : url

        Faraday.send(method_name, "#{API_URL}#{url_path}", params) do |req|
          req.headers['apikey'] = BaiduApis.api_key
        end
      end

      def method_missing(method_id, *args, &block)
        method_name = method_id.id2name
        raise "invalid operation method" unless valid_method?(method_name)
        raise "must set api_key first" unless BaiduApis.api_key

        option = {}
        block.call(option) if block_given?

        response = req(method_name, args, option)
        JSON.parse(response.body)
      end

      private
      def valid_method?(method_name)
        %w(get post).include?(method_name)
      end
    end
  end
end
