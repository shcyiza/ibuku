class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves
  has_many :notes, through: :links, source: :linkable, source_type: 'Note'
  has_many :works, through: :links, source: :linkable, source_type: 'Work'
  has_many :problematics, through: :links, source: :linkable, source_type: 'Problematic'
  include PgSearch

  def linked_items
    self.links.map {|l| l.linkable}
  end

  def self.linkable_for(linkable, user)
    ideas_selection = []
    user.ideas.each do |idea|
      unless idea.linked_items.include?(linkable)
        ideas_selection << idea
      end
    end
    return ideas_selection
  end

  def self.linked_to(linkable, user)
    ideas_selection = []
    user.ideas.each do |idea|
      if idea.linked_items.include?(linkable)
        ideas_selection << idea
      end
    end
    return ideas_selection
  end

  def link(linkable)
    self.links.where(linkable_id: linkable.id, linkable_type: linkable.class).first
  end

end
