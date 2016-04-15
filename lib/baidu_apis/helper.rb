module BaiduApis
  class Helper
    class << self
      def stock
        {
            method: "get",
            url: "apistore/stockservice/stock"
        }
      end

      def weather
        {
            method: "get",
            url: "apistore/weatherservice/cityname",
            param_key: "cityname"
        }
      end


      def phone
        {
            method: "get",
            url: "apistore/mobilenumber/mobilenumber",
            param_key: "phone"
        }
      end


      def iplookup
        {
            method: "get",
            url: "apistore/iplookupservice/iplookup",
            param_key: "ip"
        }
      end

      def meinv
        {
            method: "get",
            url: "txapi/mvtp/meinv",
            param_key: "num"
        }
      end

      def register_helper(name, config)
        send :define_singleton_method, name do
          config
        end
      end
    end
  end
end
