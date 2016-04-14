require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let!(:comments_list) { create_list(:comment, 3, user: user, commentable: post) }

  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
  it { should belong_to(:commentable) }

  describe ".latest_tree" do
    it "should return latest three comments" do
      expect(Comment.latest_three.to_a).to match_array(comments_list)
    end
  end
end
