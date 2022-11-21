class SpicesController < ApplicationController

    wrap_parameters format: []

    #GET /spices
    def index
        render json: Spice.all
    end

    #GET /spices/:id
    def show
        spice = Spice.find_by(id: params[:id])
        if spice
            render json: spice
        else
            render json: {error: "Couldn't find spice"}, status: :not_found
        end
    end

    #CREATE /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #PATCH /spices
    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: "Couldn't find spice"}, status: :not_found
        end
    end

    #DELETE /spices
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: {error: "Couldn't find spice"}, status: :not_found
        end
    end


    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
