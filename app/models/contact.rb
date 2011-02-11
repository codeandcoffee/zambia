class Contact 
  attr_accessor :name, :body, :email

  def initialize(name, email, body)
    @name = name
    @email = email
    @body = body
  end
end
