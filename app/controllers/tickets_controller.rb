class TicketsController < ApplicationController
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

	def index
    	@tickets = Ticket.all
    	@users = User.all
    	@events = Event.all
  	end

  	def show
  		
  	end

  	def new
  		
  	end

end
