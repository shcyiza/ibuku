class Note < ActiveRecord::Base
  belongs_to :origin
  belongs_to :user
  has_many :links, as: :linkable
  has_many :ideas, through: :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves
  include PgSearch

  multisearchable against: [:reference, :quote, :commentary, :page, :origin_title, :origin_description, :origin_author, :origin_editors]

  def  origin_title
    origin.title
  end

  def  origin_description
    origin.description
  end

  def  origin_author
    origin.author
  end

  def  origin_editors
    origin.editors
  end

  def self.full_text_query(search, user)
      PgSearch.multisearch(search).where(searchable_type: "Note").joins("INNER JOIN notes ON notes.id = pg_search_documents.searchable_id")
      .merge(Note.where(user_id: user.id)).map {|n| n.searchable}
  end

  def self.searchable_in_ideas(idea)
    Note.joins(:links).merge(Link.where(idea_id: idea.id))
  end

  def ideas_id
    self.ideas.map {|i| i.id}
  end

end
