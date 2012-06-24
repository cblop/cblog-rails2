class Article < ActiveRecord::Base
  attr_accessible :content, :published, :shortUrl, :slug, :tags, :title
end
