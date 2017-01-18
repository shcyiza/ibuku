class Source < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews
	has_many :notes

	has_attached_file :source_img, :styles => { :source_index => "250x350>", :source_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :source_img, :content_type => /\Aimage\/.*\Z/
end
