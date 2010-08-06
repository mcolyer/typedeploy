require 'singleton'

module Typedeploy
  class Config
    include Singleton

    @url = "http://typekit.com/api/v1/"

    class << self
      attr_accessor :directory, :api_token, :url
    end

    def self.kits_directory
      File.join(directory, "kits")
    end

    def self.kits
      kits = {}
      kits.default = ""
      kits.merge(YAML.load(File.read(kits_file)))
    end

    def self.kits_file
      File.join(directory, "kits.yml")
    end
  end
end
