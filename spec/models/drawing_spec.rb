require 'rails_helper'

RSpec.describe Drawing, type: :model do

  it "has a valid factory" do
    expect(build(:drawing)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:drawing_area) }
    it { is_expected.to validate_presence_of(:color_code) }

    it 'should save successfully ' do
      drawing = build(:drawing).save
      expect(drawing).to eq(true)
    end

    it 'ensures container presence ' do
      drawing = build(:drawing, drawing_area: nil).save
      expect(drawing).to eq(false)
    end

    it 'ensures color code presence ' do
      drawing = build(:drawing, color_code: nil).save
      expect(drawing).to eq(false)
    end

    it 'should not save successfully if user is not present ' do
      drawing = build(:drawing, user_id: nil).save
      expect(drawing).to eq(false)
    end
  end

  describe "associations" do
    it { should belong_to(:user ) }
  end

  context 'scope tests ' do
    let(:users) {create_list(:user, 5)}

    before(:each) do
      users.last(2).map{|user|create(:drawing, user_id: user.id)}
    end

    it 'should return drawings info only users created' do
      expect(Drawing.by_drawing_area.size).to eq(2)
    end

  end
end
