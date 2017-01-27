class Note < ActiveRecord::Base
  belongs_to :origin
  belongs_to :user
  has_many :links, as: :linkable
  has_many :ideas, through: :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves

  searchable do
    text :quote, :commentary, :reference, :page
  end

  def author
    author = self.origin.author
    return author
  end

  def title
    title = self.origin.title
    return title
  end

end
