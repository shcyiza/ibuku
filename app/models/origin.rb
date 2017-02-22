class Origin < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :origin_type
	has_many :reviews
	has_many :notes
	after_save -> { self.touch }
	include PgSearch

	has_attached_file :origin_img, :styles => { :origin_index => "250x350>", :origin_show => "325x475>" }, :default_url => "https://cdn1.iconfinder.com/data/icons/education-set-01/512/document-512.png"
  validates_attachment_content_type :origin_img, :content_type => /\Aimage\/.*\Z/

	multisearchable against: [:title, :description, :author, :editors]

	def self.full_text_query search
	  if search.present?
			PgSearch.multisearch(search).where(searchable_type: "Origin")
		else
		  Origin.order("title ASC")
		end
	end

end
