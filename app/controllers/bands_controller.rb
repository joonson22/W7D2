class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end
    
    def show
        @bands = Band.find(params[:id])
        render :show
    end

    def edit
        @bands = Band.find(params[:id])
        render :edit
    end

    def update
        @bands = Band.find(params[:id])
        if @bands.update(band_params)
            redirect_to band_url(@bands)
        else
            render json: @bands.errors.full_messages, status:422
        end
    end

    def new
        @bands = Band.new 
        render :new
    end

    def create
        @bands = Band.new(band_params)
        if @bands.save
            redirect_to band_url(@bands)
        else
            render json: @bands.errors.full_messages, status:422
        end
    end
    
    def destroy
        @band = Band.find(params[:id])
        @band.delete
        redirect_to bands_url
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end

end
