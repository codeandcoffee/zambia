class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author
  field :body
  field :title
  field :slug
  field :intro

  validates_presence_of :author
  validates_presence_of :title
end
