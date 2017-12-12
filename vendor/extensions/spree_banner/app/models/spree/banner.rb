module Spree
  class Banner < ActiveRecord::Base
    belongs_to :product
    has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'
    # has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'
  end
end
