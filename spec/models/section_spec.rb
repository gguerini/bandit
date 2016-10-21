require 'rails_helper'

RSpec.describe Section, type: :model do
  it { should belong_to(:race_report) }

  it { should validate_presence_of(:title)  }
  it { should validate_presence_of(:description)  }
  it { should validate_presence_of(:order)  }
  it { should validate_numericality_of(:order)  }

  describe "scopes" do
    describe "default scope" do
      let(:race_report) { create(:race_report) }
      let(:section_last) { create(:race_report_section, race_report: race_report, order: 2) }
      let(:section_first) { create(:race_report_section, race_report: race_report, order: 1) }

      it "orders the sections by default" do
        expect(Section.all).to eq([section_first, section_last])
      end
    end
  end
end
