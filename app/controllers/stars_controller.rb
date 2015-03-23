class StarsController < ApplicationController
  def index
    @stars = Star.order("created_at DESC")
    @pg_search_documents = PgSearch.multisearch(params[:query])
  end

  def show
    @star = Star.find_by_id(params[:id])
    @star = Star.new
  end

  def new
    @star = Star.new
  end

  def create
    @star = Star.create
    @star.lesson_id = params[:lesson_id]
    @star.user_id = current_user.id
    @star.save!
    redirect_to @star, notice: "You have starred a plan!"
  end

  def edit
    @star = Star.find(params[:id])
  end

  def update
    @star = Star.find(params[:id])
    if @star.update_attributes(star_params)
      redirect_to @star, notice: "The star has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    star = Star.find_by(lesson_id: params[:lesson_id], user_id: current_user.id)
    Star.destroy(star.id)
  end

private

  def star_params
    params.require(:star).permit(:upload, :topic, :description, :id, :user_id)
  end

end
