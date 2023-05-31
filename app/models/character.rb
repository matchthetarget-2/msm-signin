# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  movie_id   :integer
#
class Character < ApplicationRecord
  belongs_to(:movie, :class_name => "Movie", :foreign_key => "movie_id")
  belongs_to(:actor, :class_name => "Actor", :foreign_key => "actor_id")

  # def movie
  #   key = self.movie_id

  #   matching_set = Movie.where({ :id => key })

  #   the_one = matching_set.at(0)

  #   return the_one
  # end
end
