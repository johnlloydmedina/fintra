class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: %i[show edit update destroy]

  def index
    @members = Member.order(member_id: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show
    @member = Member.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render partial: 'member_details', locals: { member: @member } }
    end
  end

  def new
    @member = Member.new
    @member.member_id = generate_member_id
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_url, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to members_url, notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:member_id, :first_name, :middle_name, :last_name, :complete_address, :contact_number, :email_address, :gender, :civil_status, :birthdate, :age, :profile_picture, :username, :password, :password_confirmation, :account_status)
    end

    def generate_member_id
      year = Time.now.year
      string_year = year.to_s

      last_member_id = Member.where("member_id LIKE ?", "#{year}%").order(member_id: :desc).limit(1).pluck(:member_id).first
      
        if last_member_id.present?
          last_id_number = last_member_id.delete_prefix(string_year).to_i
          new_id_number = last_id_number + 1
          member_id = "#{year}#{format('%03d', new_id_number)}"
        else
          member_id = "#{year}001"
        end
    end
end
