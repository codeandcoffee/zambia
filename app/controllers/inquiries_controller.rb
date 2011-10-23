class InquiriesController < ApplicationController
  respond_to :json

  def index
    respond_with Inquiry.all
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.save
      respond_with @inquiry, status: :created, location: @inquiry
    else
      respond_with @inquiry.errors, status: :unprocessable_entity
    end
  end

end

