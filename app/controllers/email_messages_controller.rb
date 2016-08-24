class EmailMessagesController < ApplicationController
  def new
    @email_message = EmailMessage.new
  end

  def create
    @email_message = EmailMessage.new(params[:email_message])
    @email_mesage.request = request

    if @email_mesage.deliver
      flash[:success] = "Email sent! Thanks for your message!"
      redirect_to "/"
    else
      flash[:warning] = "Message cannot be sent"
      render :new
    end
  end
end

