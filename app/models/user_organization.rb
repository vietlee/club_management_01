class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  has_many :activities, as: :trackable, dependent: :destroy

  enum status: {pending: 0, joined: 1, reject: 2}

  scope :are_admin, -> {where is_admin: true}
  scope :find_with_user_of_company, -> user_id, organization_id do
    find_by user_id: user_id, organization_id: organization_id
  end
  scope :newest, -> {order created_at: :desc}

  delegate :full_name, :avatar, :email, :phone, to: :user, allow_nil: :true
  delegate :name, :description, :phone, :logo, to: :organization, allow_nil: :true

  class << self
    def join? organization
      find_by(organization_id: organization.id).nil?
    end

    def verify_manager? user
      user = find_by(id: user.id)
      return user.is_admin if user
      false
    end
  end
end
