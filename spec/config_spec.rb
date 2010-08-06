require File.dirname(__FILE__) + '/spec_helper'

describe Typedeploy::Config do
  before(:all) do
    @base_directory = File.join(File.dirname(__FILE__), "example")
    Typedeploy::Config.api_token = "token"
    Typedeploy::Config.directory = @base_directory
  end

  it "has an api token" do
    Typedeploy::Config.api_token.should == "token"
  end

  it "has a directory" do
    Typedeploy::Config.directory.should == @base_directory
  end

  it "has a kits directory" do
    Typedeploy::Config.kits_directory.should == File.join(@base_directory, "kits")
  end

  it "has a kits file" do
    Typedeploy::Config.kits_file.should == File.join(@base_directory, "kits.yml")
  end

  it "can read an existing kit" do
    Typedeploy::Config.kits.should have_key "example"
  end

  it "can return '' for a missing kit" do
    Typedeploy::Config.kits['missing'].should == ""
  end
end
