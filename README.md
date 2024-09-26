# Confluence : Fetch page content

## Used componenets:
- Programming Language: Ruby 3.3.3
- Framework: Rails 7.0.8
- Library: httparty (For third party APIs)
- Third-Party APIs: Confluence APIs V2
- Authorization: Basic Auth

## Prerequisite
### Generate API Token
- Login to your atlassian dashboard
- Generate API token from: https://id.atlassian.com/manage-profile/security/api-tokens
- Generate pages in Confluence for testing the URLs
- Do not use tiny urls of the page. Generally Confluence provide the tiny urls
- You have to find the url with the page id and use that in the script

### Configurations
- Update username and password (API token) *.env* for development environment
```
CONFLUENCE_DOMAIN=CONFLUENCE_CLOUD_DOMAIN
CONFLUENCE_USERNAME=CONFLUENCE_EMAIL
CONFLUENCE_PASSWORD=API_TOKEN
```

## Runner
- Use `rails s` command on terminal to start rails server
- Open http://localhost:3000 in your browser
- Put your confluence page url in the input box and submit

## Documentations
- Confluence APIs: https://developer.atlassian.com/cloud/confluence/rest/v2/intro/#auth
- HTTParty Library: https://github.com/jnunemaker/httparty