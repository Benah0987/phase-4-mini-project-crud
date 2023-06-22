class SpicesController < ApplicationController
    # Fetch all spices
    def index
      spices = Spice.all
      render json: spices
    end
  
    # Create a new spice
    def create
      spice = Spice.new(spice_params)
      if spice.save
        render json: spice, status: :created
      else
        render json: spice.errors, status: :unprocessable_entity
      end
    end
  
    # Update an existing spice
    def update
      spice = Spice.find_by(id: params[:id])
      if spice.update(spice_params)
        render json: spice
      else
        render json: spice.errors, status: :unprocessable_entity
      end
    end
  
    # Delete an existing spice
    def destroy
      spice = Spice.find_by(id: params[:id])
      if spice.destroy
        head :no_content
      else
        render json: spice.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def spice_params
      params.require(:spice).permit(:title, :image, :description, :notes, :rating)
    end
  end
  