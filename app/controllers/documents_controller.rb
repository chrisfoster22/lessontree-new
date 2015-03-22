class DocumentsController < ApplicationController
  attr_accessor :title, :description
  def index
    @documents = Document.find_by(current_user.id).order("created_at DESC")
    @pg_search_documents = PgSearch.multisearch(params[:query])
  end

  def show
    @document = Document.find_by_id(params[:id])
    @lessons = @document.lessons
  end

  def new
    @document = Document.new
    @lessons = Lesson.find_by_user_id(current_user.id)
  end

  def create
    @document = Document.create(document_params)
    if @document.save
      @document.lesson_id = current_user.id
      @document.save!
      redirect_to @document, notice: "The document has been successfully created."
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
    params.require(:document).permit(:title, :description, :id, :user_id,
        lessons_attributes: {document_id: :id} )
  end

end
