class HomepageController < ApplicationController

def index
   
   token = cookies[:stripe_token]
   user = User.find_by(stripe_token:token)
   p user
   if user
    redirect_to dashboard_view_path
   else
    render :index
   end

end

end
