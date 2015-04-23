class VersionsController < ApplicationController
  # before_action :require_user
  before_action :set_document_and_version, only: [:diff, :rollback, :destroy]

  def diff
    if current_user && Star.find_by(lesson_id: @document.lesson.id,
                                    user_id: current_user.id)
      @starred = true
    else
      @starred = false
    end
  end

  def rollback
    document = @version.reify
    document.save if document
    redirect_to edit_document_path(document)
  end

  private

  def set_document_and_version
    @document = Document.find(params[:document_id])
    @version = @document.versions.find(params[:id])
  end
end
