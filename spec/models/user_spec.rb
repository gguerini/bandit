require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(1).is_at_most(30) }

    it { should allow_value("foobar").for(:username) }
    it { should allow_value("foobar99").for(:username) }
    it { should_not allow_value("foobar!").for(:username) }
    it { should_not allow_value("foo bar").for(:username) }
    it { should_not allow_value("FooBar").for(:username) }

    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:username).unique(true) }

    describe "uniqueness" do
      subject { FactoryGirl.build(:user) }

      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
      it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
    end

    describe "#to_param" do
      subject { FactoryGirl.build(:user, username: "foobar") }

      its(:to_param) { should eq("foobar") }
    end

    describe "#full_name" do
      subject { FactoryGirl.build(:user, first_name: "Mo", last_name: "Farah") }

      its(:full_name) { should eq("Mo Farah") }
    end
  end
end
