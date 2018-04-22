module Api
  class BaseController < ActionController::Base
    include Authenticable
  end
end
