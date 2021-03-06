require 'data_mapper'


class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String, length: 128
  property :password, BCryptHash
  property :admin, Boolean, default: false

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end

  def create_owner
    @owner = User.create(username: "owner")
    @owner.password = "owner"
    @owner.admin = true
    @owner.save
  end

end
