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


end
