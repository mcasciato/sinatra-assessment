class Location < ActiveRecord::Base

  validates_presence_of :name
  has_many :drinks

  extend Favoritable

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    self.all.find {|instance| instance.slug == slug}
  end

end
