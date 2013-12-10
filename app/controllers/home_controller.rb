class HomeController < ApplicationController

  def index
    @page = "main-page"
    @categories = Category.select("id","title","slug")
    @topics = Topic.order('created_at desc').page params[:page]
  end
end