
require File.dirname(__FILE__) + '/spec_helper'

describe Typedeploy::Kit do
  context "hasn't been uploaded" do
    subject do
      data = {"name" => "test", "badge" => true, "analytics" => true, "domains" => ["1", "2"],
              "families" => [{"name" => "test-1", "variations" => ["i7", "n7"], "subset" => "all"}]}
      Typedeploy::Kit.new(nil, data)
    end

    it "can be published" do
      subject.should respond_to(:publish)
    end

    it "can be created" do
      subject.should respond_to(:create)
    end

    it "has one family" do
      subject.families.length.should == 1
      params = subject.families.first.to_params
      params.should have_key "variations"
      params.should have_key "subset"
    end

    it "doesn't have a kid" do
      subject.kid.should be_nil
    end

    it "can describe itself to the api" do
      params = subject.to_params
      params.should have_key "badge"
      params.should have_key "analytics"
      params.should have_key "name"
      params.should have_key "domains"
    end
  end

  context "has been uploaded" do
    subject do
      data = {"name" => "test", "badge" => true, "analytics" => true, "domains" => ["1", "2"],
              "families" => [{"name" => "test-1", "variations" => ["i7", "n7"], "subset" => "all"}]}
      Typedeploy::Kit.new("1", data)
    end

    it "has a kid" do
      subject.kid.should_not be_nil
    end
  end
end
