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
    linked_items = []
    self.links.each do |linked|
      linked_items << linked.linkable
    end
    return linked_items
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


end
