require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  describe "POST #create" do
    let(:commentable) { create(:post, user: subject.current_user) }

    it "changes the number of comments by one" do
      expect do
        post :create, ajax: true, params: { comment: attributes_for(:comment), post_id: commentable.id }
      end.to change(Comment, :count).by(1)
    end
  end
end
