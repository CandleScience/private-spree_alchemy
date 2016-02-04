module TaxonomyDecorator
  def elements_touch
    Alchemy::Element.joins('INNER JOIN alchemy_contents ON alchemy_contents.element_id=alchemy_elements.id').
                     joins('INNER JOIN alchemy_essence_spree_taxonomies ON alchemy_essence_spree_taxonomies.id=alchemy_contents.essence_id ').
                     where('alchemy_essence_spree_taxonomies.taxonomy_id=?', id).
                     update_all(updated_at: Time.zone.now)
  end
end

Spree::Taxonomy.prepend(TaxonomyDecorator)