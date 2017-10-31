class AddressesController < ApplicationController
  before_action :authenticate_student!
  
  def new
    @address  = Address.new
  end
  
  def create
    @address = Address.new(
      postcode: params[:postcode],
      student_id: current_student.id,
      prefecture_id: params[:prefecture_id],
      city1: params[:city1],
      city2: params[:city2]
    )
    
    if @address.save
        flash[:success] = "住所を登録しました。"
        redirect_to current_student
    else
        render 'root_url'
    end
  end
    
  def edit
    if current_student.address.present?
      @address = Address.find_by(student_id: current_student.id)
    else
      redirect_to new_address_path
    end
  end
  
  def update
    @address = Address.find_by(student_id: current_student.id)
    if @address.update_attributes(address_params)
      flash[:success] = "住所を変更しました。"
      redirect_to current_student
    else
      render 'edit'
    end
  end

  private
    def address_params
        params.require(:address).permit(:postcode, :prefecture_id, :city1, :city2)
    end
        
end