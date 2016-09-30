require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should have_db_index(:email).unique(true) }

    describe "uniqueness" do
      subject { FactoryGirl.build(:user) }

      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end
  end
end
