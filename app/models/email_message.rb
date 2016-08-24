class EmailMessage < MailForm::Base
  attribute :name,  :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,   :captcha => true

  def headers
    {
      :subject => "My Contact Form",
      :to => ENV["my_email_address"],
      :from => %("#{name}" <#{email}>)
    }
  end
end