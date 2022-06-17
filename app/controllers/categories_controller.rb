class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /categories
  def index
    @categories = current_user.categories
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
    @back_url = prev_url
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end



  private

    def set_category
      @category = current_user.categories.find_by(id: params[:id])
      redirect_to category_path, notice: "Unauthorized user!" if @category.nil?
    end
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category_title, :category_details, :user_id)
    end

    def prev_url
        session[:my_previous_url] = URI(request.referer || '').path
    end

end
