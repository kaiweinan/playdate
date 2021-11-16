class PlaydatesController < ApplicationController
    before_action :set_playdate, only: [:show, :edit, :update, :destroy]

        def index
            @playdates = Playdate.all
        end
    
        def show
        
        end
    
      
        def new
            @playdate = Playdate.new
        end
      
        def create
            @playdate = Playdate.create(playdate_params)
            if @playdate.save
                redirect_to playdates_path
            else
                @errors = @playdate.errors.full_messages
                render :new
            end
        end
      
        def edit
    
        end
      
        def update
            @playdate = Playdate.find_by_id(params[:id])
            if @playdate.update(playdate_params)
                redirect_to playdates_path
            else
                @errors = @playdate.errors.full_messages[0]
                render :edit
        end
        end
      
        def destroy
            @playdate.destroy
            redirect_to playdates_path
        end

        private

        def set_playdate
            @playdate = Playdate.find_by_id(params[:id])
        end

        def playdate_params
            params.require(:playdate).permit(:title, :playdate, :location, :vaccination, :personality)
        end
    
end
