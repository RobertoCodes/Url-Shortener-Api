json.success true

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
