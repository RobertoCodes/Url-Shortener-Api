json.success true

# local host would be replaced by the app's domain name
short_url[:short] = "http://localhost:3000/" + short_url[:short]

if show_count
  json.extract!(
    short_url,
    :url
  )

  json.count = short_url.visit_count
else
  json.extract!(
    short_url,
    :short, :url
  )
end
