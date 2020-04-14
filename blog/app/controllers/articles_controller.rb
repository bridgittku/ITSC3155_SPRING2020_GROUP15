class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    def index
        #@articles = Article.all
        #THIS WORKS: @articles = Article.search(params[:search])
        if params[:search]
            @articles = Article.where('title LIKE ?', "%#{params[:search]}%")
        else
            @articles = Article.all
        end
    end
    
    def search
        @articles = Article.search(params[:search])
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
    
end

private
    def article_params
        params.require(:article).permit(:title, :text, :search)
    end