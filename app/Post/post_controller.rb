require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PostController < Rho::RhoController
  include BrowserHelper

  #GET /Post
  def index
    @posts = Post.find(:all)
    render :back => '/app'
  end

  # GET /Post/{1}
  def show
    @post = Post.find(@params['id'])
    if @post
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Post/new
  def new
    @post = Post.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Post/{1}/edit
  def edit
    @post = Post.find(@params['id'])
    if @post
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Post/create
  def create
    @post = Post.create(@params['post'])
    redirect :action => :index
  end

  # POST /Post/{1}/update
  def update
    @post = Post.find(@params['id'])
    @post.update_attributes(@params['post']) if @post
    redirect :action => :index
  end

  # POST /Post/{1}/delete
  def delete
    @post = Post.find(@params['id'])
    @post.destroy if @post
    redirect :action => :index  end
end
