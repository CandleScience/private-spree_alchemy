module TaxonDecorator
  def self.prepended(base)
    base.class_eval do
      after_save :parent_elements_touch
    end
  end

  def parent_elements_touch
    taxonomy.elements_touch
  end
end

Spree::Taxon.prepend(TaxonDecorator)