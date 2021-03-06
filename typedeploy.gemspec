## This is the rakegem gemspec template. Make sure you read and understand
## all of the comments. Some sections require modification, and others can
## be deleted if you don't need them. Once you understand the contents of
## this file, feel free to delete any comments that begin with two hash marks.
## You can find comprehensive Gem::Specification documentation, at
## http://docs.rubygems.org/read/chapter/20
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'typedeploy'
  s.version           = '0.1.1'
  s.date              = '2010-08-06'
  s.rubyforge_project = 'typedeploy'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = "Manage and deploy your Typekit kits from the comfort of your own project."
  s.description = "A rubygem which provides several rake tasks to allow you to
  interact with the Typekit API directly from your project directory."

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ["Matt Colyer"]
  s.email    = 'matt at nospam colyer dot name'
  s.homepage = 'http://github.com/mcolyer/typedeploy'

  ## This gets added to the $LOAD_PATH so that 'lib/typedeploy.rb' can be required as
  ## require 'typedeploy.rb' or'/lib/typedeploy/file.rb' can be as require 'typedeploy/file.rb'
  s.require_paths = %w[lib]

  ## This sections is only necessary if you have C extensions.
  #s.require_paths << 'ext'
  #s.extensions = %w[ext/extconf.rb]

  ## If your gem includes any executables, list them here.
  #s.executables = ["name"]
  #s.default_executable = 'name'

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  #s.add_dependency('DEPtypedeploy', [">= 1.1.0", "< 2.0.0"])

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  #s.add_development_dependency('DEVDEPtypedeploy', [">= 1.1.0", "< 2.0.0"])

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    LICENSE
    README.md
    Rakefile
    lib/typedeploy.rb
    lib/typedeploy/api.rb
    lib/typedeploy/api_url.rb
    lib/typedeploy/config.rb
    lib/typedeploy/kit.rb
    lib/typedeploy/kit_loader.rb
    lib/typedeploy/rake/typedeploytask.rb
    spec/api_spec.rb
    spec/api_url_spec.rb
    spec/config_spec.rb
    spec/example/kits.yml
    spec/example/kits/example.yml
    spec/kit_loader_spec.rb
    spec/kit_spec.rb
    spec/spec_helper.rb
    typedeploy.gemspec
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
