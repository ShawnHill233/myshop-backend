object @taxon

attributes :id, :name, :description
node(:icon) do |taxon|
  if taxon.icon.try(:attachment).present?
    URI(request.url) + taxon.icon.try(:attachment).try(:url, :normal)
  end
end
