module ApplicationHelper
	include ActionView::Helpers
	def full_title(page_title = '')
		base_title = "What do you mean~"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end





end
