json.urls = json.array!(@short_urls) do |short_url|
  json.partial!('api/short_urls/short_url', short: short_url, show_count: false)
end
