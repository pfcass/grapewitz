class CommentsController < ApplicationController
  def show
  end

  def edit
    @comment = Comment.find( params[:id].to_i )
  end

  def update
      c = Comment.find( params[:id] )
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
