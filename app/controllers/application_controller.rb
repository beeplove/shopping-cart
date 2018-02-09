class ApplicationController < ActionController::API

  #
  # To standarize the api response
  #
  def jsonator data
    render json: {
      status: 'success',
      data: data
    }, status: :ok
  end
end
