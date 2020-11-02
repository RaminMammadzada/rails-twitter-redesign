module Bootstrap::ModalHelper
  ArgumentError = Class.new(StandardError)
  def modal_trigger(text, options={})
    options = canonicalize_options(options)
    href = options.delete(:href) or raise(ArgumentError, 'missing :href option')
    options.merge!(role: 'button', href: href, data: { toggle: 'modal'})
    options = ensure_class(options, 'btn')

    content_tag(:a, text, options)
  end

  def modal(options={})
    options = canonicalize_options(options)
    options.has_key?(:id) or raise(ArgumentError, "missing :id option")
    options = ensure_class(options, %w(modal fade))
    content_tag(:div, options) do
      content_tag(:div, class: 'modal-dialog', role: :document) do
        content_tag(:div, class: 'modal-content') do
          yield
        end
      end
    end
  end

  def modal_header(*args, &block)
    options = canonicalize_options(args.extract_options!)
    options = ensure_class(options, 'modal-header')

    content = block_given? ? capture(&block) : args.shift

    button_content = content_tag(:button, class: :close, data: { dismiss: :modal }, aria: { label: 'Close' }) do
      content_tag(:span, "×".html_safe, aria: { hidden: true }).html_safe + content_tag(:span, "Close", class: 'sr-only')
    end

    content_tag(:div, options) do
      content_tag(:h4, content, class: 'modal-title') + button_content.html_safe
    end.html_safe

  end

  def modal_title(*args, &block)
    bootstrap_generator(*args, 'modal-title', :h4, &block)
  end

  def modal_body(*args, &block)
    bootstrap_generator(*args, 'modal-body', :div, &block)
  end

  def modal_footer(*args, &block)
    options = canonicalize_options(args.extract_options!)
    options = ensure_class(options, 'modal-footer')

    content = block_given? ? capture(&block) : args.shift
    button_close_content = content_tag(:button, 'Close', type: :button, class: 'btn btn-secondary', data: { dismiss: :modal })
    content_tag(:div, options) do
      button_close_content + content
    end
  end
end