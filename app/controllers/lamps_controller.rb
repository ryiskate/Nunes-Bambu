class LampsController < ApplicationController
     #index, show, new, edit, create, update and destroy
     before_action :require_admin, only: [:edit]
     
    def index
        @thing = Lamp.all
    end
    
    def show
        @lamp = Lamp.find(params[:id])
        @commentable = @lamp
        @item = @lamp
    end
    
#    def new
#        @lamp = Lamp.new
#    end

#    def edit
#        @lamp = Lamp.find(params[:id])
#    end

#    def create
#        @lamp = Lamp.new(lamp_params)
#        if @lamp.save
#            redirect_to @lamp
#        else
#            render 'new'
#        end
#    end

#    def update
#       @lamp = Lamp.find(params[:id])
#       if @lamp.update(lamp_params)
#           redirect_to @lamp
#       else
#           render 'edit'
#       end
#    end
    
#    def destroy
#        @lamp = Lamp.find(params[:id])
#        @lamp.destroy
#        redirect_to admin_lamps_path
#    end
    
#    private
    
#    def lamp_params
#        params.require(:lamp).permit(:name, :description, :price)    
#    end
    
end
