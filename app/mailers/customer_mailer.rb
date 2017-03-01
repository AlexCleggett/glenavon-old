class CustomerMailer < ApplicationMailer
    default from: 'acleggs23@gmail.com'
    def confirmation_email(customer)
        @customer = customer
        mail(to: @customer.email_address, subject: 'Welcome to My Awesome Site')
    end
end
