class DrinksController < ApplicationController
    def index
        # needs template
        @drinks = Drink.all
    end
    
    # Create a drink
    def new
        # Needs A Template
        @drink = Drink.new
    end

    def create
        # Creates an instance and redirects
        @drink = Drink.new(req_params)
        if @drink.save
            redirect_to drinks_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    # Edit a Drink
    def edit
        @drink = Drink.find(params[:id])
    end

    def update
        @drink = Drink.find(params[:id])
        if @drink.update(req_params)
            redirect_to drinks_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    # Delete a Drink (Still encounters issues)
    def destroy
        @drink = Drink.find(params[:id])
        @drink.destroy
        redirect_to drinks_path, status: :see_other
    end
    
    
    private
        def req_params
            params.require(:drink).permit(:brand, :quantity, :description)
        end
        
end
