require 'fileutils'
require 'rake'
require 'rake/tasklib'

module Typedeploy
  class TypedeployTask
    def initialize
      define
    end

    def define
      namespace :typedeploy do
        desc "Create the necessary files to integrate typekit with your project"
        task :init do
          FileUtils.mkdir_p(Config.kits_directory)

          example_file = File.join(Config.kits_directory, "example.yml")
          File.open(example_file, "w") do |f|
            f.write(<<-eos
---
kit:
  name: "example"
  badge: true
  analytics: true
  domains:
  - localhost
  families:
  - id: droid-serif
    subset: all
    variations:
    - n4
    - i4
    - n7
    - i7
              eos
            )
          end
        end

        desc "Create kits based on definitions in kits/*.yml"
        task :create do
          kits = {}
          Typedeploy::KitLoader.each do |kit, name|
            kits[name] = kit.create
          end

          File.open(Config.kits_file, "w") do |f|
            f.write(kits.to_yaml)
          end
        end


        desc "Update kits with the latest settings in kits/*.yml"
        task :update do
          kits = {}
          Typedeploy::KitLoader.each do |kit, name|
            kits[name] = kit
          end

          Typedeploy::Config.kits.each_pair do |name, kit_id|
            if kits[name].publish
              puts "#{kit_id} successfully published"
            else
              puts "#{kit_id} not published"
            end
          end
        end
      end
    end
  end
end
