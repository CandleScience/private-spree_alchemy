module TaxonDecorator
  after_save :parent_elements_touch

  def parent_elements_touch
    taxonomy.elements_touch
  end
end

Spree::Taxon.prepend(TaxonDecorator)