require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:ip_address) }

    it 'should save successfully ' do
      user = build(:user).save
      expect(user).to eq(true)
    end

    it 'ensures container presence ' do
      user = build(:user, ip_address: nil).save
      expect(user).to eq(false)
    end
  end

  describe "associations" do
    it { should have_many(:drawings) }
  end

  context 'scopes tests' do
    let(:users) {create_list(:user, 5)}
    before(:each) do
      users.last(2).map{|user|user.drawings.create}
    end

    it 'should return all users data some users only created drawings' do
      expect(User.by_drawing_summary.size).to eq(5)
    end

    it 'should return all users even though drawings were not created  by users' do
      expect(User.by_drawing_summary.size).to eq(5)
    end
  end

end
