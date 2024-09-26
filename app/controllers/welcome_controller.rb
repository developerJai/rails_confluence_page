class WelcomeController < ApplicationController
  def index
    page_url = params[:page_url]
    if page_url.present?
      if page_url.include?(ENV["CONFLUENCE_DOMAIN"])
        @result = Confluence::PageContent.fetch(page_url)
        @msg = "Invalid page url" unless @result
      else
        @msg = "Invalid page url"
      end
    end
  end
end
