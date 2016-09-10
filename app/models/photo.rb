class Photo < ActiveRecord::Base
	belongs_to :user
	has_many :ucomments

	has_attached_file :image,
				styles: {large: '400x400>', medium: '200x200>', small: '120x120>'}

	validates_attachment :image, presence: true,
				content_type: { content_type: %w( image/jpeg image/jpg image/gif image/png) }

	validates :caption, presence: true, length: { maximum: 50}
end

