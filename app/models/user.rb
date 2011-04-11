class User < ActiveRecord::Base
  has_one :oauth, :dependent => :destroy

  def self.create_with_omniauth(auth)
    user = create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.screen_name = auth["user_info"]["nickname"]
    end
  end
end
