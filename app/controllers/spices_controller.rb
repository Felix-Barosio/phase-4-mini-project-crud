class SpicesController < ApplicationController

    wrap_parameters format: []

    #GET /spices
    def index
        render json: Spice.all
    end

    #GET /spices/:id
    def show
        spice = find_spice
        if spice
            render json: spice
        else
            not_found_response
        end
    end

    #CREATE /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #PATCH /spices
    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            not_found_response
        end
    end

    #DELETE /spices
    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else
            not_found_response
        end
    end


    private

    def find_spice
        Spice.find_by(id: params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def not_found_response
        render json: {error: "Couldn't find spice"}, status: :not_found
    end

end
