class  Api::V1::RsvpsController < ApplicationController
    def index
        @rsvps = Rsvp.all
        render json: @rsvps
    end
end
