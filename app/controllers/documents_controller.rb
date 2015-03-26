class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :show, :update,
        :destroy, :document_frame, :version_history]
  attr_accessor :title, :description

  def index
    @documents = Document.find_by(current_user.id).order("created_at DESC")
  end

  def show
    @document = Document.find_by(id: 111)
    @lesson = @document.lesson
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = WickedPdf.new.pdf_from_string("#{@document.content}")
    #     render pdf: "pdf"
    #   end
    # end
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

  def upload_file
    @document = Document.new
    @lesson_id = Lesson.find(params[:id]).id
  end

  def destroy
    lesson_id = @document.lesson.id
    @document.destroy!
    redirect_to lesson_path(lesson_id)
  end

  def document_frame
    @lesson = Lesson.find_by(id: 111)
    # render :layout => false
  end

  def version_history
  end

private

  def document_params
    params.require(:document).permit(:title, :content, :user_id, :lesson_id, :upload)
  end

  def set_document
    @document = Document.find_by_id(params[:id])
    redirect_to root_path if @document.nil?
  end

end
