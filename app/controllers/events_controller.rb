class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            flash[:notice] = "Event creation successful!"
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description)
    end
end