# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string
#  genre      :string
#  actor      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, :genre, :actor, presence: true

  def self.search(query)
    where("title like ?", "%#{query}%")
    where("genre like ?", "%#{query}%")
    where("actor like ?", "%#{query}%")
  end
=begin
  def self.search
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{:search}%"])
    else
      find(:all)
    end
  end
=end
end
