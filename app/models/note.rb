class Note < ActiveRecord::Base
  belongs_to :origin
  belongs_to :user
  has_many :links, as: :linkable
  has_many :ideas, through: :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves
  include PgSearch

  multisearchable against: [:reference, :quote, :commentary, :page, :title, :description, :author, :editors,]
  belongs_to :origin
  delegate :title, to: :origin, prefix: true
	delegate :description, to: :origin, prefix: true
	delegate :author, to: :origin, prefix: true
  delegate :editors, to: :origin, prefix: true

  def self.full_text_query search
      PgSearch.multisearch(search).where(searchable_type: "Note").map {|n| n.searchable}
  end

  def self.searchable_in_ideas(idea)
    Note.joins(:links).merge(Link.where(idea_id: idea.id))
  end

  def ideas_id
    self.ideas.map {|i| i.id}
  end

end
