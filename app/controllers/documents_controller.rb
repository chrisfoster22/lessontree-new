class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :show, :update, :destroy]
  attr_accessor :title, :description
  def index
    @documents = Document.find_by(current_user.id).order("created_at DESC")
  end

  def show
    @lessons = @document.lesson
  end

  def new
    @document = Document.new
    @lesson_id = Lesson.find(params[:lesson_id]).id
  end

  def create
    @document = Document.create(document_params)
    lesson = @document.lesson
    if @document.save
      redirect_to lesson, notice: "The document has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @document.update_attributes(document_params)
      redirect_to @document, notice: "The document has been successfully updated."
    else
      render action: "edit"
    end
  end

private

  def document_params
    params.require(:document).permit(:title, :content, :user_id, :lesson_id)
  end

  def set_document
    @document = Document.find_by(id: params[:id])
    redirect_to root_path if @document.nil?
  end

end
