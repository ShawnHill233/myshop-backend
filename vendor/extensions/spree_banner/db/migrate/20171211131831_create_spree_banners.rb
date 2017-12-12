class CreateSpreeBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_banners do |t|
      t.string :site
      t.belongs_to :product
    end
  end
end
