require "rails_helper"

RSpec.describe Organization, type: :model do
  context "column_specifications" do
    it{should have_db_column(:name).of_type(:string)}
    it{should have_db_column(:description).of_type(:text)}
    it{should have_db_column(:phone).of_type(:string)}
    it{should have_db_column(:email).of_type(:string)}
    it{should have_db_column(:location).of_type(:text)}
    it{should have_db_column(:logo).of_type(:string)}
  end

  context "associations" do
    it{expect have_many :clubs}
    it{expect have_many(:users).through(:user_organizations)}
    it{expect have_many :user_organizations}
    it{expect have_many :club_requests}
    it{expect have_many :notifications}
    it{expect have_many(:activities)}
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
    it {should validate_uniqueness_of(:name)}
    it "is valid with a max lenght of name" do
      expect validate_length_of(:name)
        .is_at_most Settings.max_name
    end
    it "is valid with a valid name" do
      expect(FactoryGirl.build(:organization,
        name: "a" * Settings.max_name)).to be_valid
    end
    it "is invalid without name" do
      expect(FactoryGirl.build(:organization, name: nil)).not_to be_valid
    end
    it "is invalid with a long name" do
      expect(FactoryGirl.build(:organization,
        name: "a" * (Settings.max_name + 1)))
        .not_to be_valid
    end
  end

  context "scope" do
    let!(:organization1){FactoryGirl.create :organization}
    let!(:organization2){FactoryGirl.create :organization}
    let!(:user1){FactoryGirl.create :user}
    let!(:user_organization1){FactoryGirl.create :user_organization, user_id: user1.id, organization_id: organization1.id}
    let!(:user_organization2){FactoryGirl.create :user_organization, user_id: user1.id, organization_id: organization2.id}
    it "by_user_organizations" do
      organizations = Organization.by_user_organizations(user1.user_organizations)
      expect(organizations).to eq [organization1, organization2]
    end
  end
end
