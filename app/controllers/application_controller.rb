class ApplicationController < ActionController::API

  # TODO: For now keeping code and message same for all errors
  rescue_from StandardError do |exception|
    raise exception if Rails.env.development? && params[:force].blank?

    message = 'something happened which was not quite expected'
    code = 1000

    erronator(code, message)
  end


  #
  # To standarize the api success response
  #
  def jsonator data
    render json: {
      status: 'success',
      data: data
    }, status: :ok
  end

  # To standarize the api error response
  def erronator code, message, description=nil
    error = {
      message: message,
      code: code
    }
    error[:description] = description if description.present?

    render json: {
      status: 'error',
      error: error
    }, status: :unprocessable_entity
  end
end
