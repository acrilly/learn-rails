class VisitorsController < ApplicationController

  def new
    # Assign the Visitor model to an instance variable
    @visitor = Visitor.new
  end

  def create
    # Instantiate the visitor instance variable with attributes from the submitted form
    @visitor = Visitor.new(secure_params)

    # Validate the visitor instance variable
    if @visitor.valid?
      # If valid, subcribe the visitor to the mailing list and redirect to the home page
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      # If invalid, redisplay the home page (the new action)
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end

end
