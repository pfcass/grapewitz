class CommentsController < ApplicationController

  def create
    respond_to do |format|
      wine = Wine.find(params[:wine_id].to_i)
      comment = wine.comments.create
      comment.comment = params[:comment][:comment]
      comment.user_id = current_user.id
      if comment.save!
        format.html { redirect_to :back, notice: 'Your comment has been duly noted' }
        format.json { render action: 'show', status: :created, location: @wine }
      else
        format.html { render action: 'new' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end

  end


  def edit
    @comment = Comment.find(params[:id].to_i)
  end

  def update
    c = Comment.find(params[:id])
    c.comment = params[:comment][:comment]
    respond_to do |format|
      if c.save
        format.html { redirect_to wines_path, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  end
end
