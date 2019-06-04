require 'test_helper'

module Components
  class ButtonGroupHelperTest < HelperTestCase
    def test_help_bubble
      body = 'hello world'
      expected = <<-HTML
        <span class="tooltipped" aria-label="hello world"><span class="help-bubble"></span></span>
      HTML

      assert_ltrim_dom_equal expected, view.help_bubble(body)

      expected_with_direction = <<-HTML
        <span class="tooltipped tooltipped-ne" aria-label="hello world"><span class="help-bubble"></span></span>
      HTML

      assert_ltrim_dom_equal expected_with_direction, view.help_bubble(body, direction: 'ne')

      expected_with_extra_attributes = <<-HTML
        <span class="js-foo tooltipped" aria-label="hello world" id="bar"><span class="help-bubble"></span></span>
      HTML

      assert_ltrim_dom_equal expected_with_extra_attributes, view.help_bubble(body, class: 'js-foo', id: 'bar')

      expected_with_accompanying_text = <<-HTML
        <span class="tooltipped" aria-label="hello world"><span class="help-bubble help-bubble--with-text" data-accompanying-text="Why can't I edit this?"></span></span>
      HTML

      assert_ltrim_dom_equal expected_with_accompanying_text, view.help_bubble(body, accompanying_text: "Why can't I edit this?".html_safe)
    end
  end
end
