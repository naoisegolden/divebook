module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
    content_for(:page_title) { page_title }
  end

  def tagline(tagline)
    content_for(:page_tagline) { tagline }
  end

end
