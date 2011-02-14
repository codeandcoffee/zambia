class HomeController < ApplicationController
  def index
  end

  def about
  end
  
  def staufs
  end

  def contact_email
    @contact = Contact.new(params[:name], params[:email], params[:body])
    ContactMailer.contact_email(@contact).deliver
    #render :contact, :layout => false
    render :contact
  end

end
