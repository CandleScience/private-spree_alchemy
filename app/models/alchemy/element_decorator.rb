module ElementDecorator
  def cache_key
    "alchemy/elements/#{id}-#{updated_at}"
  end
end

Alchemy::Element.prepend(ElementDecorator)
