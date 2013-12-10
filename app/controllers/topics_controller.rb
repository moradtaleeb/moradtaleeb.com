class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all.page params[:page]
    @categories = Category.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @categories = Category.all
    @cat_id = @topic.category.id
    @related_topics = Topic.select('id','title','summary','slug').where('category_id = (?) and id not in (?)', @cat_id, @topic.id).order('RANDOM()').limit(2)
  end

  # GET /topics/new
  def new
    @topic = Topic.new
    @categories = Category.all
    @tags = Tag.all
  end

  # GET /topics/1/edit
  def edit
    @categories = Category.all
    @tags = Tag.all
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    #params[:topic][:tag_ids] ||= []
    #binding.pry
    @topic.tag_ids = params[:topic][:tag_ids] ||= []
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :summary, :content, :category_id)
    end
end
