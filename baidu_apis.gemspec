# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baidu_apis/version'

Gem::Specification.new do |spec|
  spec.name          = "baidu_apis"
  spec.version       = BaiduApis::VERSION
  spec.authors       = ["adamshen"]
  spec.email         = ["adam_ruby@126.com"]
  spec.summary = %q{Simple wrapper for the Baidu APIs}
  spec.description = %q{Simple wrapper for the Baidu APIs}
  spec.homepage = "https://github.com/adamshen/baidu_apis"
  spec.license = "MIT"
  spec.files = %w(LICENSE.txt README.md)
  spec.files += Dir["lib/**/*"]

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
