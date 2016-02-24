json.success true
json.extract!(
  short_url,
  :short, :url
)

if show_count
  json.count = short_url.visit_count
end
