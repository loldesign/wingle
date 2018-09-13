module CompleteRegisterHelper

	def select_tag_with_error(name, options_collection, prompt, include_blank = nil, errors)

		content = ""
		if errors.present?
			content << "<div class='field_with_errors'>"
			content << " #{select_tag(name, options_collection, prompt: prompt, include_blank: include_blank)}"
			content << " <span class='error'>#{errors.join(', ')}</span>"
      content << "</div>"   
    else
			content << "#{select_tag(name, options_collection, prompt: prompt, include_blank: include_blank)}"
    end

    content.html_safe
	end
end