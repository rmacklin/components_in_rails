require 'test_helper'

module Components
  class ButtonGroupHelperTest < HelperTestCase
    def test_button_group
      actual = view.button_group(class: 'my-class', :'data-wat' => 'wut') do |button_group|
        safe_concat '<span>stuff</span>'
        concat button_group.button('My Cool Button', active: true)
        safe_concat '<span>mo stuff</span>'
        concat(button_group.button(url: 'http://www.google.wat', class: 'js-foo', :'data-bar' => 'wat') do
          '<span class="icon icon-line-chart"></span> Button Link with HTML'.html_safe
        end)
        concat(button_group.button(:'data-foo' => 'bar') do
          '<b>Button with HTML</b>'.html_safe
        end)
        safe_concat '<span>last stuff</span>'
      end

      expected = <<-HTML
        <div class="my-class button-group" data-wat="wut">
          <span>stuff</span>
          <button class="button is-active">
            My Cool Button
          </button>
          <span>mo stuff</span>
          <a class="js-foo button" data-bar="wat" href="http://www.google.wat">
            <span class="icon icon-line-chart"></span> Button Link with HTML
          </a>
          <button class="button" data-foo="bar">
            <b>Button with HTML</b>
          </button>
          <span>last stuff</span>
        </div>
      HTML

      assert_predicate actual, :html_safe?
      assert_ltrim_dom_equal expected, actual
    end

    def test_button
      actual_with_text_and_url = ButtonGroup.new(view).button('My Text', active: true, url: 'www.foo.bar')
      expected = <<-HTML
        <a class="button is-active" href="www.foo.bar">
          My Text
        </a>
      HTML

      assert_predicate actual_with_text_and_url, :html_safe?
      assert_ltrim_dom_equal expected, actual_with_text_and_url

      actual_with_block_and_no_url = ButtonGroup.new(view).button(active: false, disabled: true) do
        safe_concat '<span class="icon icon-line-chart"></span> Wat Button'
      end
      expected = <<-HTML
        <button class="button" disabled="disabled">
          <span class="icon icon-line-chart"></span> Wat Button
        </button>
      HTML

      assert_predicate actual_with_block_and_no_url, :html_safe?
      assert_ltrim_dom_equal expected, actual_with_block_and_no_url
    end
  end
end
