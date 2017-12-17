module Spree
  module Api
    module V1
      class BrandsController < Spree::Api::BaseController
        def show
          @taxon = Spree::Taxon.find(params[:id])
        end

      end
    end
  end
end
