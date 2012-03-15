module PostsHelper
  def status_tag(boolean, options={})
	options[:true]		||=''
	options[:true_class]	||= 'status true'
	options[:false]		||= ''
	options[:false_class]	||= 'status false'

	if boolean
	     content_tag(:span, options[:true], :class => options[:true_class])
	else
	     content_tag(:span, options[:false], :class => options[:false_class])
	end
  end
# <% text = Post.content %>

# <%= simple_format(word_wrap(text, :line_width => 30)) %>


end
