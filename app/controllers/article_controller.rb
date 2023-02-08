class ArticleController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if(params[:id])
            render json: Article.find(params[:id])
        elsif(params[:category])
            render json: Article.where(category: params[:category])
        elsif params[:author]
            render json: Article.where(author: params[:author])
        elsif params[:title]
            render json: Article.where('title Like ?', "%#{params[:title]}%")
        elsif params[:start_date] && params[:end_date]
            render json: Article.where("date_published BETWEEN ? AND ?", params[:start_date], params[:end_date])
        else
            render json: Article.all()
        end
    end
    
    def create
        render json: Article.create(title: params[:title], author: params[:author], body: params[:body], category: params[:category], date_published: params[:date_published]);
    end

    def update
        article = Article.find(params[:id])
        if(params[:author])
            article.name = params[:author]
        end
        if params[:title]
            article.title = params[:title]
        end
        if params[:category]
            article.category = params[:category]
        end
        if params[:body]
            article.body = params[:body]
        end
        article.save
        render json: article
    end

    def delete
        Article.destroy_by(id: params[:id])
        render json: Article.all()
    end

    def articles_pagination
        render json: Article.limit(params[:size]).offset((params[:index].to_i - 1) * params[:size].to_i)
    end
end
