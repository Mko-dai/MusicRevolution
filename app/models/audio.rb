class Audio < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  
  has_many :comments  
  has_many :users,      through: :likes

  validates :title, presence: true
  validates :file,  presence: true


end
