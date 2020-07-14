class ProjectService::Update
  def initialize(current_project:, name:)
    @current_project = current_project
    @name = name
  end

  def call
    update_params
  end

  private

  def update_params
    if @current_project.update(name: @name)
      { json: ProjectSerializer.new(@current_project).serialized_json, status: :ok }
    else
      { json: { errors: [@current_project.errors.full_messages] }, status: :unprocessable_entity }
    end
  end
end
