class StandardErrorsHandler
  attr_reader :error, :status, :request_path

  def initialize(error, request_path, status)
    @error = error
    @request_path = request_path
    @status = status
  end

  def serializable_hash
    {
      source: { pointer: request_path },
      detail: error,
      status: status
    }
  end
end
