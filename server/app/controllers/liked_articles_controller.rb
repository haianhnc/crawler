class LikedArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like_article, only: [:destroy]

  def index
    @liked_articles = LikedArticle.where(user_id: current_user.id)
  end

  def create
    user_id = current_user.id
    article_id = params[:article_id]
    @like_article = LikedArticle.create(user_id: user_id, article_id: article_id)
    if @like_article.save
      flash[:notice] = "Create succeed"
      @article = Article.find(article_id)
      redirect_to @article
    else
      @like_articles = LikedArticle.all
      redirect_to
    end
  end

  def destroy
    @like_article.destroy
    if @like_article.destroyed?
      flash[:notice] = "Delete succeed"
    else
      flash[:alert] = "Delete fail"
    end
    redirect_to article_path(@like_article.article)
  end

  private

  def set_like_article
    @like_article = LikedArticle.find_by(article_id: params[:id].to_i, user_id: current_user.id)
  end

end
