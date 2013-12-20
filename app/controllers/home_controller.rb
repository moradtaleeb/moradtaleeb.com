class HomeController < ApplicationController

  def index
    @page = "main-page"
    @categories = Category.select("id","title","slug")
    @topics = Topic.where('published = true').order('created_at desc').page params[:page]
  end
end