# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments
  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
    @idea_id = params[:idea_id]
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to ideas_url, notice: 'Comment was successfully destroyed.'
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment, notice: 'Comment created'
    else
      render :new
    end
  end

  def set_comment
    @comment = Comment.find(params[:id] || :comment_id)
    @idea_id = @comment.idea_id || params[:idea_id]
  end

  def comment_params
    params.require(:comment).permit(
      :body,
      :idea_id
    )
  end
end
