class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  # attr_accessor :direction
  # UP='Up'
  # DOWN='Down'
  # DIRECTIONS=[UP,DOWN]
  # validates_inclusion_of :direction, in: [DIRECTIONS]
  # scope :upvote where(:direction => UP) 
  # scope :downvote where(:direction => DOWN)


end
