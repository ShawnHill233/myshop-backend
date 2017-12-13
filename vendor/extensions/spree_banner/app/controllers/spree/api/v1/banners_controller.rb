module Spree
  module Api
    module V1
      class BannersController < Spree::Api::BaseController
        def index
          @banners = Spree::Banner.all.order(:site)
        end

      end
    end
  end
end
