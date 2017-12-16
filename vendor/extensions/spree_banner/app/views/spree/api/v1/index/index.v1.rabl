object false

child(@banners => :banners) do
  attributes :id, :site, :product_id
  node(:image_url) { |banner| URI(request.url) + banner.image.attachment.url(:large) }
end

child(@tire_brands => :tire_brands) do
  attributes :id, :name, :meta_title, :meta_description
  node(:icon) do |taxon|
    if taxon.icon.try(:attachment).present?
      URI(request.url) + taxon.icon.try(:attachment).try(:url, :normal)
    end
  end
  node(:taxon_id) { |taxon| taxon.id }
end
