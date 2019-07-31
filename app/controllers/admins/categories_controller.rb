class Admins::CategoriesController < ApplicationController

  before_action :authenticate_admin!

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	@category.save
    redirect_to new_admins_category_path
  end

  def show
    @category = Category.find(params[:id])

    @categories = @category.posts.all.page(params[:page]).per(10)

    @search = Post.ransack(params[:q])
    if params[:q]
      # 検索結果
      @posts = @search.result.order(created_at: :desc).page(params[:page]).per(10)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    end
     @most_viewed = Post.order('impressions_count DESC')
                  .where("? <= created_at", Time.now.prev_week)
                  .where("created_at <= ?", Time.now).take(10)
  end

  private
  def category_params
  	params.require(:category).permit(:name)
  end
end
