class HomeController < ApplicationController
  def index
    @page = "main-page"
    @categories = Category.select("id","title")
    @topics = Topic.order('created_at desc')
  end
end