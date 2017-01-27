class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves
  has_many :works, through: :links
  has_many :problematics, through: :links

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

  def notes
    linked_items = []
    self.links.where(linkable_type: "Note").each do |linked|
      linked_items << linked.linkable
    end
    return linked_items
  end

end
