class BirthdaysController < ApplicationController
  before_action :set_category
  before_action :set_category_birthday, only: [:show, :update, :destroy]

  # GET /category/:category_id/birthdays
  def index
    json_response(@category.birthdays)
  end

  # GET /category/:category_id/birthdays/:id
  def show
    json_response(@birthday)
  end

  # POST /categories/:category_id/birthdays
  def create
    @category.birthdays.create!(birthday_params)
    json_response(@category, :created)
  end

  # PUT /category/:category_id/birthdays/:id
  def update
    @birthday.update(birthday_params)
    head :no_content
  end

  # DELETE /categories/:category_id/birthdays/:id
  def destroy
    @birthday.destroy
    head :no_content
  end

  private

  def birthday_params
    params.permit(:fname, :lname, :date)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_category_birthday
    @birthday = @category.birthdays.find_by!(id: params[:id]) if @category
  end
end