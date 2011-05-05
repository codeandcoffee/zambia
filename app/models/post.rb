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
  
  def to_slug
    #strip the string
    ret = title.strip

    #blow away apostrophes
    ret.gsub! /['`]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
     ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'  

     #convert double underscores to single
     ret.gsub! /_+/,"_"

     #strip off leading/trailing underscore
     ret.gsub! /\A[_\.]+|[_\.]+\z/,""
  
    ret
  end
end
