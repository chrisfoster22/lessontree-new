class PlansController < ApplicationController
  attr_accessor :title, :description
  def index
    @plans = Plan.find_by(current_user.id).order("created_at DESC")
    @pg_search_documents = PgSearch.multisearch(params[:query])
  end

  def show
    @plan = Plan.find_by_id(params[:id])
    @lessons = @plan.lessons
  end

  def new
    @plan = Plan.new
    @lessons = Lesson.find_by_user_id(current_user.id)
  end

  def create
    @plan = Plan.create(plan_params)
    if @plan.save
      @plan.user_id = current_user.id
      @plan.save!
      redirect_to @plan, notice: "The plan has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      redirect_to @plan, notice: "The plan has been successfully updated."
    else
      render action: "edit"
    end
  end

private

  def plan_params
    params.require(:plan).permit(:title, :description, :id, :user_id,
        lessons_attributes: {plan_id: :id} )
  end

end
