class Api::v1::EventsController < ApplicationController
    def index
        @events = Event.all
        render json: @events
    end
end
