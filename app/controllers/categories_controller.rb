class CategoriesController < ApplicationController

  load_resource class: 'Category'

  def index

  end

  def new

  end

  def create
    @category = Category.create(resource_params)
    if @category.save!
      redirect_to categories_path, notice: "Категория '#{@category.name}' была успешно создана"
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    @category.update(resource_params)
    if @category.save!
      redirect_to categories_path, notice: "Категория '#{@category.name}' была успешно изменёна"
    else
      render action: :edit
    end
  end

  def works
    @projects = @category.projects
  end

  def destroy
    @category.destroy!
    redirect_to categories_path, notice: 'Категория была удалена'
  end

  def resource_params
    params.require(:category).permit(:name, :description, :created_at, :updated_at, :fon)
  end


end