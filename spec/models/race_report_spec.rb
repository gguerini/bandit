require 'rails_helper'

RSpec.describe RaceReport, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:sections).dependent(:destroy) }

  it { should have_db_index(:user_id) }

  it { should accept_nested_attributes_for(:sections).allow_destroy(true) }

  it { should be_active }

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:race_date) }
    it { should validate_presence_of(:status) }
  end
end
