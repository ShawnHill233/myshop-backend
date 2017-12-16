object @taxonomy

attributes :id, :name
node(:icon) { |taxon| taxon.icon }
