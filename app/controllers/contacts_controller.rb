class ContactsController < ApplicationController

  def new
     # Instantiate an empty Contact model, 
     # assign it to the @contact instance variable, and 
     # render the app/views/contacts/new.html.erb view

    @contact = Contact.new
  end

  def create
    # Instantiate a new Contact model using the data from the form
    # assign it to the @contact instance variable
    @contact = Contact.new(secure_params)

    # Validated the contact model instance using the validation requirements in the model
    if @contact.valid?
      # TODO send message
      flash[:notice] = "Message sent from #{@contact.name}."

     # Redirect to the home page
      redirect_to root_path
    else
     # If any validation fails, render the app/views/contacts/new.html.erb view. 
     # This time, appropriate error messages are set and the form object’s error_notification method will highlight the invalid field and display a matching prompt
      render :new
    end
  end

  private

  def secure_params
     # Protect from “mass-assignment vulnerabilities” security exploit by screening parameters sent from the browser
     # Require that the params has contains :contact, and
     # only permit :name, :email, :content 'white listed' variables
    params.require(:contact).permit(:name, :email, :content)
  end

end
