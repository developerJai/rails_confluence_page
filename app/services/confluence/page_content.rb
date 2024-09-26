class Confluence::PageContent < Confluence::Base
  # Fetch page content
  def fetch_page_content(confluence_url)
    page_id = extract_page_id(confluence_url)
    puts "Page id #{page_id}"
    unless page_id
      puts "Invalid page id"
      return false
    end
    body_format = "view" # atlas_doc_format / view / styled_view / editor / storage
    response = self.class.get("https://tecorb11.atlassian.net/wiki/api/v2/pages/#{page_id}?body-format=#{body_format}", headers: @headers)

    if response.success?
      # Fetches the page content in storage format
      return response.dig("body", body_format, "value")
    else
      puts "Error fetching page: #{response.code} - #{response.message}"
      return false
    end
  end

  def self.fetch url
    self.new.fetch_page_content(url)
  end
end
