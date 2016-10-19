class HomeController < ApplicationController
    #index, show, new, edit, create, update and destroy
    
    def index
        @product = Product.find_by_id(13)
        byebug
    end
    
end
