collection @banners => :banners
attributes :id, :site, :product_id
node(:image_url) { |banner| URI(request.url) + banner.image.attachment.url(:large) }
