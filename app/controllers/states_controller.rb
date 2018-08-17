class StatesController < ApplicationController 

  def index
    render json: State.all
  end

  def show
    @state = State.find(params[:id])
    render json: @state
  end

end
