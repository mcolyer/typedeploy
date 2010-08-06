module Typedeploy
  class ApiUrl
    def initialize(endpoint, format)
      @endpoint = endpoint
      @format = format
    end

    def publish(kit_id)
      "#{base}kits/#{kit_id}/publish"
    end

    def create
      "#{base}kits/"
    end

    def link_family(kit_id, family_id)
      "#{base}kits/#{kit_id}/families/#{family_id}"
    end

  protected
    def base
      "#{@endpoint}#{@format}/"
    end
  end
end
