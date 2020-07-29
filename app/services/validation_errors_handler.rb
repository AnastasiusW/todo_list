class ValidationErrorsHandler
  attr_reader :errors, :status

  def initialize(errors, status)
    @errors = errors
    @status = status
  end

  def serializable_hash
    errors.messages.map do |att, message|
      {
        source: { pointer: "data/attributes/#{att}" },
        detail: message,
        status: status
      }
    end
  end
end
