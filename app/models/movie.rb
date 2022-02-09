class Movie < ApplicationRecord
  validates :title, presence: true

  def self.titles
    pluck(:title)
  end

  def self.most_fb_likes
    order(facebook_likes: :desc)
  end

  def self.release_year_by_title(target_title)
    find_by(title: target_title)
  end
end