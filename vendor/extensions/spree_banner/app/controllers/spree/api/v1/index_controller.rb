module Spree
  module Api
    module V1
      class IndexController < Spree::Api::BaseController
        def index
          # taxonomies = Spree::Taxonomy.accessible_by(current_ability, :read).order('name').includes(root: :children)
          @tire_brands = Spree::Taxonomy.find_by(name: '轮胎品牌').taxons.where.not(parent_id: nil)
          @banners = Spree::Banner.all.order(:site)
        end

      end
    end
  end
end
