require File.dirname(__FILE__) + '/spec_helper'

describe Typedeploy::Api do
  subject do
    base_directory = File.join(File.dirname(__FILE__), "example")
    Typedeploy::Config.directory = base_directory
    Typedeploy::Api.new
  end

  it "can publish a kit" do
    Typedeploy::Api.should_receive(:request).with(:post, "https://typekit.com/api/v1/yaml/kits/1/publish", {}).and_return(true)
    subject.publish("1").should be_true
  end

  it "can create a kit" do
    kit = nil
    Typedeploy::KitLoader.each { |k, n| kit = k if n == "example"}
    kit_params = kit.to_params
    family_params = kit.families.first.to_params

    Typedeploy::Api.should_receive(:request).with(:post, "https://typekit.com/api/v1/yaml/kits/", kit_params).and_return([true, {"kit" => {"id" => "123"}}.to_yaml])
    Typedeploy::Api.should_receive(:request).with(:post, "https://typekit.com/api/v1/yaml/kits/123/families/droid-serif", family_params).and_return([true, ""])
    subject.create(kit).should == "123"
  end
end

