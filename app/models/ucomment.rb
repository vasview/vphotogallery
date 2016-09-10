class Ucomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo

  validates :body, presence: true, length: { maximum: 250}
  
end
