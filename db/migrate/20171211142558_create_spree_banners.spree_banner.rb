# This migration comes from spree_banner (originally 20171211131830)
class CreateSpreeBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_banners do |t|
      t.string :site
      t.belongs_to :product
    end
  end
end
