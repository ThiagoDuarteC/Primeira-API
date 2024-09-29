class PostsController < ApplicationController
    before_action :set_post, only: %i[ show update destroy ]

    def index
        @posts = Post.order(created_at: :desc)

        render json: @posts
    end

    def show
        if @post.present?
            render json: @post
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render json: @post, status: :created
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def update
        if @post.update(post_params)
            render json: @post
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @post.destroy
            head :ok
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.permit(:title, :content, :author)
    end

end
