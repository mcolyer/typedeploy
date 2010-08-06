require File.dirname(__FILE__) + '/spec_helper'

describe Typedeploy::KitLoader do
  subject do
    @base_directory = File.join(File.dirname(__FILE__), "example")
    Typedeploy::Config.directory = @base_directory
    Typedeploy::KitLoader
  end

  it "can iterate over all existing kit configurations" do
    kits = {}
    subject.each { |k, n| kits[n] = k }
    kits["example"].to_params.should == {
      "name"=>"example",
      "domains"=>"localhost",
      "badge"=>true,
      "analytics"=>true
    }

    kits["example"].families.size.should == 1
    kits["example"].families.first.to_params.should =={
      "variations"=> "n4,i4,n7,i7",
      "subset"=>"all"
    }
  end
end
