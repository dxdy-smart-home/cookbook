class TagsController < ApplicationController
  def index
    tags = Tag.ordered
    render locals: { tags: tags }
  end

  def new
    render locals: { tag: Tag.new }
  end

  def create
    tag = Tag.new tag_params

    if tag.save
      redirect_to tags_path, notice: "Тег успешно создан"
    else
      render :new, locals: { tag: tag }
    end
  end

  def edit
    tag = Tag.find params[:id]
    render locals: { tag: tag }
  end

  def update
    tag = Tag.find params[:id]

    if tag.update tag_params
      redirect_to tags_path, notice: "Тег успешно обновлен"
    else
      render :edit, locals: { tag: tag }
    end
  end

  def destroy
    tag = Tag.find params[:id]
    tag.destroy

    redirect_to tags_path, notice: "Тег успешно удален"
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :color)
  end
end
