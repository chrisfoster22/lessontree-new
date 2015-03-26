class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :show, :update,
        :destroy, :version_history]
  before_action :set_lesson, only: [:show, :create, :udate, :destroy, :upload_file]
  attr_accessor :title, :description

  def index
    @documents = Document.find_by(current_user.id).order("created_at DESC")
  end

  def show
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
    @lesson_id = @lesson.id
  end

  def create
    @document = Document.create(document_params)
    if @document.save
      redirect_to @lesson, notice: "The document has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @document.update_attributes(document_params)
      redirect_to @lesson, notice: "The document has been successfully updated."
    else
      render action: "edit"
    end
  end

  def upload_file
    @document = Document.new
    @lesson_id = @lesson.id
  end

  def destroy
    @document.destroy!
    redirect_to @lesson, notice: "The document has been successfully deleted."
  end

  def version_history
  end

  private

  def document_params
    params.require(:document).permit(:title, :content, :user_id, :lesson_id, :upload)
  end

  def set_document
    @document = Document.find_by(id: params[:id])
    redirect_to root_path if @document.nil?
  end

  def set_lesson
    @lesson = Lesson.find_by(id: params[:id])
  end
end
