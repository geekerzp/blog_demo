require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  login_user

  describe "GET #index" do
    let!(:articles_list) { create_list(:article, 2, user: subject.current_user) }

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the articles into @articles" do
      get :index
      expect(assigns(:articles)).to match_array(articles_list)
    end
  end

  describe "GET #show" do
    let!(:article) { create(:article, user: subject.current_user) }

    it "responds successfully with an HTTP 200 status code" do
      get :show, params: { id: article.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, params: { id: article.id }
      expect(response).to render_template("show")
    end

    it "loads property article to @article" do
      get :show, params: { id: article.id }
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "GET #edit" do
    let!(:article) { create(:article, user: subject.current_user) }

    it "responds successfully with an HTTP 200 status code" do
      get :edit, params: { id: article.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      get :edit, params: { id: article.id }
      expect(response).to render_template("edit")
    end

    it "loads property article to @article" do
      get :edit, params: { id: article.id }
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "GET #new" do
    it "responses successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new templates" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "responses successfully with an HTTP 302 status code" do
      post :create, params: { article: attributes_for(:article) }
      expect(response).to have_http_status(302)
    end

    it "redirects to index path" do
      post :create, params: { article: attributes_for(:article) }
      expect(response).to redirect_to(articles_path)
    end
  end

  describe "PATCH #update" do
    let!(:article) { create(:article, user: subject.current_user) }

    it "responses successfully with an HTTP 302 status code" do
      patch :create, params: { id: subject.current_user.id, article: attributes_for(:article) }
      expect(response).to have_http_status(302)
    end

    it "redirects to index path" do
      patch :create, params: { id: subject.current_user.id, article: attributes_for(:article) }
      expect(response).to redirect_to(articles_path)
    end
  end

  describe "DELETE #destroy" do
    let!(:article) { create(:article, user: subject.current_user) }

    it "responses successfully with an HTTP 302 status code" do
      delete :destroy, params: { id: subject.current_user.id }
      expect(response).to have_http_status(302)
    end

    it "redirects to index path" do
      delete :destroy, params: { id: subject.current_user.id }
      expect(response).to redirect_to(articles_path)
    end
  end
end
