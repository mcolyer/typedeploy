require 'yaml'

module Typedeploy
  class KitLoader
    def self.each(&block)
      kits = []
      Dir.glob(File.join(Config.kits_directory, "*.yml")) do |file|
        name = File.basename(file, ".yml")
        kits << [self.parse(Config.kits[name], file), name]
      end
      kits.each(&block)
    end

  protected
    def self.parse(id, file)
      data = File.read(file)
      yaml = YAML.load(data)
      Kit.new(id, yaml['kit'])
    end
  end
end
