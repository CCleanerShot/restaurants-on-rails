class TestController < ApplicationController
  def index
    # TODO: look into how this key is actually meant to be used. Is this a public key?
    @google_maps_platform_api_key = ENV["GOOGLE_MAPS_PLATFORM_API_KEY"]
  end

  def testing

  end
end
