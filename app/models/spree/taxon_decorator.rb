module TaxonDecorator
  extend ActiveSupport::Concern
  included do
    after_save :parent_elements_touch
  end

  def parent_elements_touch
    taxonomy.elements_touch
  end
end

Spree::Taxon.prepend(TaxonDecorator)