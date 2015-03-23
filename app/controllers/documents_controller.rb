class DocumentsController < ApplicationController
  attr_accessor :title, :description
  def index
    @documents = Document.find_by(current_user.id).order("created_at DESC")
  end

  def show
    @document = Document.find_by_id(params[:id])
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
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
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

end
