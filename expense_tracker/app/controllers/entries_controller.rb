class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    entries = Entry.all
    render json: entries
  end

  def show
    render json: @entry
  end

  def create
    entry = Entry.new(entry_params)
    if entry.save
      render json: entry, status: :created
    else
      render json: entry.errors, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      render json: @entry
    else     
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
  end

  def summary
    income = Entry.where(entry_type: "income").sum(:amount)
    expense = Entry.where(entry_type: "expense").sum(:amount)
    balance = income - expense
    render json: {income: income, expense: expense, balance: balance}
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:amount, :category, :entry_type, :date)
  end
end
