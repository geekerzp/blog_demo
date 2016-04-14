# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :string
#  commentable_id   :integer
#  commentable_type :string
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  include Cache::Comment

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, presence: true

  def self.latest_three
    order("created_at DESC").first(3)
  end
end
