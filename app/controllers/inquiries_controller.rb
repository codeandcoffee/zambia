class InquiriesController < ApplicationController
  respond_to :json

  def index
    respond_with Inquiry.all
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.save
      InquiryMailer.inquiry_email(@inquiry).deliver
      respond_with @inquiry, status: :created, location: @inquiry
    else
      respond_with @inquiry.errors, status: :unprocessable_entity
    end
  end

  def update
    @inquiry = Inquiry.find(params[:id])

    if @inquiry.update_attributes(params[:inquiry])
      InquiryMailer.inquiry_email(@inquiry).deliver
      respond_with nil, status: :no_content
    else
      respond_with @inquiry.errors, status: :unprocessable_entity
    end
  end

end

