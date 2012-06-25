class Article < ActiveRecord::Base
  attr_accessible :content, :published, :shortUrl, :slug, :tags, :title

  scope :by_tag, lambda{|tag| where(:tags => tag)}


end
