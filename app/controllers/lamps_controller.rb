class LampsController < ApplicationController

  ALLOWED_QUERY_PARAMS = [:name, :latitude, :longitude, :status]
  def index
    query = create_search_query
    if query.present?
      @lamps = Lamp.where(query)
    else
      @lamps = Lamp.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lamps}
    end
  end

  def new
  end

  def update
    lamp = Lamp.find(params[:id])
    lamp.update_attributes(lamp_params)
    respond_to do |format|
      format.html {redirect_to lamps_path}
      format.json {redirect_to lamp_path(lamp)}
    end

  end

  def create
    lamp = Lamp.create!(lamp_params)
    respond_to do |format|
      format.html {redirect_to lamps_path}
      format.json {redirect_to lamp_path(lamp)}
    end
  end

  def destroy
    lamp = Lamp.find(params[:id])
    lamp.destroy!
    redirect_to lamps_path
  end

  def show
    @lamp = Lamp.find(params[:id])
    render json: @lamp
  end

  private

  def create_search_query
    where_clause = []
    values = []
    ALLOWED_QUERY_PARAMS.each do |param|
      if params[param].present?
        where_clause << "#{param} = (?)"
        values << params[param]
      end
    end
    if values.any?
      values.unshift(where_clause.join(' AND '))
    end
    values
  end

  def lamp_params
    params.require(:lamp).permit(:name, :latitude, :longitude, :status)
  end


end
