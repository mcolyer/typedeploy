require File.dirname(__FILE__) + '/spec_helper'

describe Typedeploy::ApiUrl do
  subject do
    Typedeploy::ApiUrl.new("/", :yaml)
  end

  it "can create a kit create url" do
    subject.create.should == "/yaml/kits/"
  end

  it "can create a family link create url" do
    subject.link_family(1,2).should == "/yaml/kits/1/families/2"
  end

  it "can create a kit publish url" do
    subject.publish(1).should == "/yaml/kits/1/publish"
  end
end
