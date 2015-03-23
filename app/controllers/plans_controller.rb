class PlansController < ApplicationController
  before_action :set_plan
  attr_accessor :title, :description
  def index
    @plans = Plan.where(user_id: current_user.id).order("created_at DESC")
    stars = Star.where(user_id: current_user.id, lesson_id: nil)
    @starred_plans = []
    stars.each do |s|
      plan = Plan.find_by(id: s.plan_id)
      @starred_plans << plan
    end
  end

  def show
    @lessons = @plan.lessons
    @star = Star.new
    if Star.find_by(plan_id: @plan.id, user_id: current_user.id)
      @starred = true
    else
      @starred = false
    end
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
  end

  def update
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

  def set_plan
    @plan = Plan.find_by(id: params[:id])
    redirect_to root_path if @plan.nil?
  end

end
