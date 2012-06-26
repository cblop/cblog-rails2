class Article < ActiveRecord::Base
  attr_accessible :content, :published, :shortUrl, :slug, :tags, :title, :tag_list
  has_and_belongs_to_many :tags
  def tag_list
      self.tags.map { |t| t.name }.join(", ")
  end

  def tag_list=(new_value)
      tag_names = new_value.split(/,\s+/)
      self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(:name => name) }
  end


end
