class ReviewsController < ApplicationController
    before_action :set_playdate, except: [:index]
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    
    def index
    end

    def show
        @playdate = Playdate.find(params[:playdate_id])
        @review = Review.find(params[:id])
    end

    def new
         @playdate = Playdate.find(params[:playdate_id]) 
        @review = @playdate.reviews.build
        
    end

    def create
        @review = Review.new(review_params)
    
        if @review.save
            redirect_to playdate_path(@playdate)

        else
            @errors = @review.errors.full_messages
            render :new
        end
    end

    def edit 
        @review = Review.find(params[:id])
        @playdate = Playdate.find(params[:playdate_id])
    end

    def update
        @review.update(review_params)
        redirect_to playdate_path(@review.playdate_id)
    end

    def destroy
        @review.destroy
        redirect_to playdates_path 
    end

    private
    def set_review
        @review = Review.find_by_id(params[:id])
    end
    def set_playdate
        @playdate = Playdate.find_by_id(params[:playdate_id])
    end

    def review_params
        params.require(:review).permit(:description, :user_id, :playdate_id)
       end 

end