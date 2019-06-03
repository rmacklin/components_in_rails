module ApplicationHelper
  def render_example_code(path)
    path = Pathname.new(path)

    unless path.absolute?
      path = Rails.root.join('app/views', path.dirname, "_#{path.basename}.html.erb")
    end

    File.read(path)
  end
end
