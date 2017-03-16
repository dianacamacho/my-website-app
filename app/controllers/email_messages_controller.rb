class EmailMessagesController < ApplicationController
  def new
    @email_message = EmailMessage.new
    @page_title_details = "About Me"
  end

  def create
    @email_message = EmailMessage.new(params[:email_message])
    @email_message.request = request

    if @email_message.deliver
      flash[:success] = "Email sent! Thanks for your message!"
      redirect_to "/"
    else
      flash[:warning] = "Message cannot be sent"
      render :new
    end
  end
end

