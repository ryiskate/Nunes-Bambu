class AdminController < ApplicationController
     #index, show, new, edit, create, update and destroy
    
    def index
    end
    
    def lamps
        @lamp = Lamp.all
    end
end
