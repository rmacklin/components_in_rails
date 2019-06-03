module Components
  module ButtonGroupHelper
    class ButtonGroup
      def initialize(view_context)
        @view_context = view_context
      end

      def button(text = nil, active: false, url: nil, **element_attributes, &block)
        element_attributes = element_attributes.stringify_keys

        if element_attributes['class']
          element_attributes['class'] += ' '
        else
          element_attributes['class'] = ''
        end
        element_attributes['class'] += 'button'
        element_attributes['class'] += ' is-active' if active

        if text.present?
          if url.present?
            @view_context.link_to(text, url, element_attributes)
          else
            @view_context.content_tag(:button, text, element_attributes)
          end
        else
          if url.present?
            @view_context.link_to(url, element_attributes, &block)
          else
            @view_context.content_tag(:button, element_attributes, &block)
          end
        end
      end
    end

    def button_group(element_attributes = {}, &block)
      element_attributes = element_attributes.stringify_keys

      if element_attributes['class']
        element_attributes['class'] += ' '
      else
        element_attributes['class'] = ''
      end
      element_attributes['class'] += 'button-group'

      content_tag(:div, element_attributes) do
        capture(ButtonGroup.new(self), &block)
      end
    end
  end
end
