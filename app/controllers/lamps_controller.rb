class LampsController < ApplicationController
     #index, show, new, edit, create, update and destroy
    def index
        @lamp = Lamp.all
    end
    
    def show
        @lamp = Lamp.find(params[:id])
    end
    
    def new
    end
    
    def create
        @lamp = Lamp.new(lamp_params)
        @lamp.save
        redirect_to @lamp
    end
    
    private
    
    def lamp_params
        params.require(:lamp).permit(:name, :description, :price)    
    end
    
end
