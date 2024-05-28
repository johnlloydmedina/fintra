class LoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[show edit update destroy]

  def index
    @loans = Loan.paginate(page: params[:page], per_page: 10)
  end

  def show
    @loan = Loan.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render partial: 'loan_details', locals: { loan: @loan } }
    end
  end

  def new
    @loan = Loan.new
    @loan.control_number = generate_control_no
  end

  def edit
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      redirect_to loans_url, notice: 'Loan was successfully created.'
    else
      render :new
    end
  end

  def update
    if @loan.update(loan_params)
      redirect_to @loan, notice: 'Loan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @loan.destroy
    redirect_to loans_url, notice: 'Loan was successfully destroyed.'
  end

  private

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:control_number, :member_id, :loan_type_id, :loan_amount, :loan_duration, :loan_status, :processed_by, :mode_of_payment, :purpose, :remarks)
    end

    def generate_control_no
      year = Time.now.year
      last_loan = Loan.where("control_number LIKE ?", "#{year}%").order(control_number: :desc).first
        if last_loan.present?
          string_year = year.to_s
          last_id_number = last_loan.control_number.split(string_year).last.to_i
          new_id_number = last_id_number + 1
          control_number = "#{year}#{'%03d' % new_id_number}"
        else
          control_number = "#{year}001"
        end
    end
end
