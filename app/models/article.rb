class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
	length: { minimum: 5 }
	
	scope :search, lambda { |terms|
		where("title LIKE :t OR text LIKE :t", :t => "%#{terms}%")
	}
	
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	 validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
end