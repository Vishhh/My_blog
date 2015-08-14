class UsersController < ApplicationController
    def index

    end

    def new
    end

    def edit
    end

    def show
    end

    def update
    current_user = User.find(params[:id])
      if current_user.update(current_user_params)
        redirect_to current_user
      else
        render 'edit'
      end
    end
  
  private

  def current_user_params
    params.require(:user).permit(:first_name, :last_name, :email,:images_attributes => [:image_name, :imageable_id , :imageable_type])
  end

end
