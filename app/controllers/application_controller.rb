class ApplicationController < ActionController::Base
  include Pagy::Backend
  include KittensHelper
end
