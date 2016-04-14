# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  include Taggable

  belongs_to :user

  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, presence: true
end
