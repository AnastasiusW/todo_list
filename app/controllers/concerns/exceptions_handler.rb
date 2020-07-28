module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from JWT::DecodeError, with: :not_authorize
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_record
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def not_authorize
    render json: { errors: [I18n.t('errors.authorize_fail')] }, status: :unauthorized
  end

  def not_found_record
    render json: { errors: [I18n.t('errors.authorize_fail')] }, status: :not_found
  end

  def user_not_authorized
    render json: { error: I18n.t('pundit.errors.user.warning') }, status: :forbidden
  end
end
