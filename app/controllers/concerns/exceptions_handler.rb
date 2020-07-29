module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from JWT::DecodeError, with: :not_authenticate
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_record
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def not_authenticate
    standard_error(I18n.t('errors.authenticate_fail'), :unauthorized)
  end

  def not_found_record
    standard_error(I18n.t('errors.not_found'), :not_found)
  end

  def user_not_authorized
    standard_error(I18n.t('pundit.errors.user.warning'), :forbidden)
  end

  def validation_error(errors, status)
    hundler = ValidationErrorsHandler.new(errors, status)
    render json: ErrorSerializer.new(hundler), status: status
  end

  def standard_error(error, status)
    hundler = StandardErrorsHandler.new(error, request.path, status)
    render json: ErrorSerializer.new(hundler), status: status
  end
end
