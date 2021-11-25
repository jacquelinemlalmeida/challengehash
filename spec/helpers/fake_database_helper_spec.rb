require 'rails_helper'

RSpec.describe FakeDatabaseHelper do
include FakeDatabaseHelper

  describe "#database" do
    it "returns a json file like a Array" do
      expect(database).to be_a_kind_of(Array)
    end
  end
end