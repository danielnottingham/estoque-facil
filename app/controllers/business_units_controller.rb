class BusinessUnitsController < ApplicationController
  before_action :set_business_unit, only: [:show, :edit, :update, :destroy]

  def index
    @business_units = BusinessUnit.all
  end

  def new
    @business_unit = BusinessUnit.new
  end

  def show; end

  def create
    @business_unit = BusinessUnit.new(business_unit_params)

    respond_to do |format|
      if @business_unit.save
        format.html { redirect_to @business_unit, notice: 'Business unit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @business_unit.update(business_unit_params)
        format.html { redirect_to @business_unit, notice: 'Business unit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @business_unit.destroy
    redirect_to business_units_path, notice: 'Business unit was successfully destroyed.'
  end

  private

  def set_business_unit
    @business_unit = BusinessUnit.find(params[:id])
  end

  def business_unit_params
    params.require(:business_unit).permit(:name, :phone, :email, :address)
  end
end
