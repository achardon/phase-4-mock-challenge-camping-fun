class CampersController < ApplicationController

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serializer: CamperActivitiesSerializer
        else
            render json: {error: "Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper 
            render json: camper, status: :created
        else
            render json: {errors: "validation errors"}, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
