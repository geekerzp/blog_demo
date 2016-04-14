module Taggable
  extend ActiveSupport::Concern

  included do
    attr_accessor :tags_string

    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings

    after_initialize :tags_to_tags_string
    before_save :tags_string_to_tags
  end

  protected

  def tags_to_tags_string
    self.tags_string = tags.map(&:name).join(",")
  end

  def tags_string_to_tags
    tags_names = tags_string.to_s.split(",").map(&:strip)
    tags = tags_names.map { |name| Tag.find_or_create_by(name: name) }
    tags.each do |tag|
      self.tags << tag unless self.tags.exists? tag
    end
  end
end
