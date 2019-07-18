class Admins::PostsController < ApplicationController
  def index
    @search = Post.ransack(params[:q])
    if params[:q]
      # 検索結果
      @posts = @search.result.order(created_at: :desc).page(params[:page]).per(10)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    end
    #PVランキング
    #.yesterdayで一日の記事ランキング
    #.prev_weekで一週間のランキング
    @most_viewed = Post.order('impressions_count DESC')
                  .where("? <= created_at", Time.now.prev_week)
                  .where("created_at <= ?", Time.now).take(10)
  end

  def show
    @post = Post.find(params[:id])
    #nilの後に , :unique => [:session_hash] と入力すると同じユーザーが何回見てもカウントされない
    impressionist(@post, nil)

    @comment = Comment.new

    @comments = @post.comments.all.page(params[:page]).per(10)

    #総コメント数カウント
    # @comments_count = Comment.where(@comment.id).count
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
end
