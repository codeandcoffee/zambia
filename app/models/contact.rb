class Contact 
  attr_accessor :body, :email

  def initialize(email, body)
    @email = email
    @body = body
  end
end
