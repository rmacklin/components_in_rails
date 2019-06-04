module Components
  module HelpBubbleHelper
    include ActionView::Helpers::TagHelper

    def help_bubble(message, direction: nil, accompanying_text: nil, **element_attributes)
      element_attributes = element_attributes.stringify_keys

      classes = [
        element_attributes['class'],
        'tooltipped',
        ("tooltipped-#{direction}" if direction.present?)
      ].compact.join(' ')

      help_bubble_classes = [
        'help-bubble',
        ('help-bubble--with-text' if accompanying_text.present?)
      ].compact.join(' ')

      content_tag(
        :span,
        element_attributes.merge(
          'class' => classes,
          'aria-label' => message
        )
       ) do
        content_tag(:span, '', :class => help_bubble_classes, :'data-accompanying-text' => accompanying_text)
      end
    end
  end
end
