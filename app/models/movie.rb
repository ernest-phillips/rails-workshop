class Movie < ApplicationRecord
  validates :title, presence: true

  def self.titles
    pluck(:title)
  end

  def self.most_fb_likes
    order(facebook_likes: :desc)
  end

  def self.release_year_by_title(target_title)
    find_by(title: target_title)&.year
  end

  def self.count_with_facebook_likes(target_likes)
    # WHERE movies.facebook_likes > ?
    where("facebook_likes >?", target_likes)
  end
end