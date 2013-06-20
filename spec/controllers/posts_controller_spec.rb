require 'spec_helper'

describe PostsController do
  let(:valid_attributes) { { "title" => "post title", "description" => "post description", "url" => "http://domain.com" } }

  let(:valid_post) { Post.new valid_attributes }

  describe "GET index" do
    it "assigns all posts as @posts" do
      Post.should_receive(:all).and_return([valid_post])

      get :index, {}
      assigns(:posts).should eq([valid_post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      Post.should_receive(:find).with(valid_post.id.to_s).and_return(valid_post)

      get :show, {id: valid_post.id}
      assigns(:post).should eq(valid_post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, {}
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      Post.should_receive(:find).with(valid_post.id.to_s).and_return(valid_post)

      get :edit, {id: valid_post.id}
      assigns(:post).should eq(valid_post)
    end
  end

  describe "POST create" do
    before do
      Post.any_instance.stub(:save)
    end

    it "assigns a newly created post as @post" do
      post :create, {post: valid_attributes}
      assigns(:post).should be_a(Post)
    end

    describe "with valid params" do
      before do
        Post.any_instance.should_receive(:save).and_return(true)
      end

      it "redirects to the created post" do
        post :create, {post: valid_attributes}
        response.should redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      before do
        Post.any_instance.should_receive(:save).and_return(false)
      end

      it "re-renders the 'new' template" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, {post: { "title" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:new_attributes) {{ "title" => "MyString" }}
    let(:do_request) { put :update, {id: valid_post.id, post: new_attributes} }

    before do
      Post.should_receive(:find).with(valid_post.id.to_s).and_return(valid_post)
    end

    describe "with valid params" do
      before do
        valid_post.should_receive(:update).with(new_attributes).and_return(true)
        do_request
      end

      it "assigns the requested post as @post" do
        assigns(:post).should eq(valid_post)
      end

      it "redirects to the post" do
        response.should redirect_to(valid_post)
      end
    end

    describe "with invalid params" do
      before do
        valid_post.should_receive(:update).with(new_attributes).and_return(false)
        do_request
      end

      it "assigns the post as @post" do
        assigns(:post).should eq(valid_post)
      end

      it "re-renders the 'edit' template" do
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "redirects to the posts list" do
      Post.should_receive(:find).with(valid_post.id.to_s).and_return(valid_post)
      valid_post.should_receive(:destroy)
      delete :destroy, {id: valid_post.id}

      response.should redirect_to(posts_url)
    end
  end
end
