module Bootstrap::CardHelper
  def card(options={})
    options = canonicalize_options(options)
    options = ensure_class(options, %w(card))
    content_tag(:div, options) do
      content_tag(:div, class: 'card-block') do
        yield
      end
    end
  end

  def card_header(*args, &block)
    bootstrap_generator(*args, 'card-header', :h5, &block)
  end

  def card_title(*args, &block)
    bootstrap_generator(*args, 'card-title', :h5, &block)
  end

  def card_subtitle(*args, &block)
    bootstrap_generator(*args, 'card-subtitle mb-2 text-muted', :h6, &block)
  end

  def card_body(*args, &block)
    bootstrap_generator(*args, 'card-text', :p, &block)
  end

  def card_list(*args, &block)
    bootstrap_generator(*args, 'list-group list-group-flush', :ul, &block)
  end

  def card_list_item(*args, &block)
    bootstrap_generator(*args, 'list-group-item', :li, &block)
  end
end