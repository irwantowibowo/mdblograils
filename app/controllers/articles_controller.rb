class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @article = Article.all
  end

  def show
    
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(resources_params)
    @article.user = User.first

    if @article.save
      flash[:success] = "Berhasil menambahkan data"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @article.update(resources_params)
      flash[:success] = "Berhasil mengubah data"
      redirect_to article_path(@article)
    else
      flash[:success] = "Gagal mengubah data"
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Berhasil hapus data"
      redirect_to articles_path
    end
  end

  private
    def resources_params
      params.require(:article).permit(:title,:description)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end