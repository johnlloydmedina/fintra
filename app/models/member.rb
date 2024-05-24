class Member < ApplicationRecord
    has_secure_password
    
    validates :first_name, :last_name, :email_address, :username, presence: true
    validates :email_address, :username, uniqueness: true
    validates :contact_number, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
    
    mount_uploader :profile_picture, ProfilePictureUploader
  
    def full_name
      "#{first_name} #{middle_name} #{last_name}".strip
    end
  
    enum account_status: { active: 0, inactive: 1 }
end
