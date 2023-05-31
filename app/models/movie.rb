# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:title, presence: true)

  belongs_to(:director, :class_name => "Director", :foreign_key => "director_id")
  has_many(:characters, :class_name => "Character", :foreign_key => "movie_id")

  has_many :cast, through: :characters, source: :actor

  has_many :bookmarks, class_name: "Bookmark", foreign_key: "movie_id"

  has_many :bookmarkers, through: :bookmarks, source: :user
  # def director
  #   key = self.director_id

  #   matching_set = Director.where({ :id => key })

  #   the_one = matching_set.at(0)

  #   return the_one
  # end
end
