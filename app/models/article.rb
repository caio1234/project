class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
	length: { minimum: 5 }
	
	scope :search, lambda { |terms|
		where("title LIKE :t OR text LIKE :t", :t => "%#{terms}%")
	}
end