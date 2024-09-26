require 'httparty'
require 'uri'
require 'base64'

class Confluence::Base
  include HTTParty

  def initialize
    credentials = "#{ENV['CONFLUENCE_USERNAME']}:#{ENV['CONFLUENCE_PASSWORD']}"
    auth = Base64.strict_encode64(credentials)
    @headers = {
      'Content-Type' => 'application/json',
      'Authorization' => 'Basic '+ auth
    }
  end

  # Extract the page ID from the link
  def extract_page_id(confluence_url)
    uri = URI(confluence_url)
    segments = uri.path.split('/')

    # Handle the case for 'viewpage.action'
    if segments.include?('pages') && segments.index('pages') + 1 < segments.size
      return segments[segments.index('pages') + 1]
    end

    # Handle the case for 'x/YIAC'
    if segments.include?('x') && segments.index('x') + 1 < segments.size
      return segments[segments.index('x') + 1]
    end

    nil  # Return nil if no valid page ID is found
  end
end
