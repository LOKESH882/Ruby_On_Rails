class Book < ApplicationRecord
  before_create :create_message
  before_update :update_message
  after_destroy :log_book_deletion

  private

  def create_message
    Rails.logger.info "Before Create"
  end

  def update_message
     Rails.logger.info "Before Update"
  end

  def log_book_deletion
    Rails.logger.info "Book with title '#{title}' has been deleted."
  end
end
