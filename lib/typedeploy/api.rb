require 'net/http'
require 'net/https'

module Typedeploy
  class Api
    def initialize
      @api_url = ApiUrl.new(Config.url, :yaml)
    end

    def publish(kid)
      successful, body = self.class.request(:post, @api_url.publish(kid), {})
      successful
    end

    def create(kit)
      successful, body = self.class.request(:post, @api_url.create, kit.to_params)

      if successful
        data = YAML.load(body)
        kit.kid = data['kit']['id']
        puts "Created #{kit} as #{kit.kid}"

        kit.families.each do |family|
          successful, body = self.class.request(:post, @api_url.link_family(kit.kid, family.fid), family.to_params)

          if successful
            puts "#{family} added to #{kit.kid}"
          else
            puts "Error adding #{family} to #{kit.kid}"
          end
        end
        kit.kid
      else
        puts "Error creating #{kit}"
      end
    end

  protected

    def self.request(method, url, data=nil)
      url = URI.parse("#{url}?token=#{Config.api_token}")

      parsed_url = url.path+"?"+url.query

      req = case method
      when :get: Net::HTTP::Get.new(parsed_url)
      when :post: Net::HTTP::Post.new(parsed_url)
      end

      req.set_form_data(data) if data

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      res = http.start { |http| http.request(req) }

      case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        [true, res.body]
      else
        [false, res.body]
      end
    end
  end
end
