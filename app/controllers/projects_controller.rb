class ProjectsController < ApplicationController
  load_resource :category, class: 'Category'
  load_resource through: :category, class: 'Project'

  def index

  end

  def new

  end

  def create
    @project = @category.projects.create(resource_params)
    if @project.save!
      redirect_to category_projects_path(@category), notice: "Проект '#{@project.name}' был успешно создан"
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    @project.update(resource_params)
    if @project.save!
      redirect_to category_projects_path(@category), notice: "Проект '#{@project.name}' был успешно изменён"
    else
      render action: :edit
    end
  end

  def destroy
    @project.destroy!
    redirect_to category_projects_path, notice: 'Проект был удалён'
  end

  def resource_params
    params.require(:project).permit(:name, :description, :created_at, :updated_at, :picture, :category_id)
  end
end