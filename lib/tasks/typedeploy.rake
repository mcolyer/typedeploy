require 'fileutils'

task :init do
  FileUtils.mkdir(Config.kits_directory)

  example_file = File.join(Config.kits_directory, "example.yml")
  File.open(, "w") do |f|
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

task :create do
  Typedeploy::KitLoader.each do |kit, name|
    kits[name] = kit.create
  end

  File.open(Config.current_kits_file, "w") do |f|
    f.write(kits.to_yaml)
  end
end

task :update do
  Typedeploy::KitLoader.each do |kit, name|
    if kit.publish
      puts "#{kit_id} successfully published"
    else
      puts "#{kit_id} not published"
    end
  end
end

