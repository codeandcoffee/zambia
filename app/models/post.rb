class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author
  field :body
  field :title
  field :slug
end
