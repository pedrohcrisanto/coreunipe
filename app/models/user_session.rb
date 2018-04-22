class UserSession < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  private

    def generate_token
      self.expire_date = 1.year.from_now
      begin
        self.token = SecureRandom.urlsafe_base64
      end while self.class.exists?(token: token)
    end

end
