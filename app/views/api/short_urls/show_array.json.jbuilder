json.set! :urls do 
  json.array!(@short_urls) do |short_url|
    json.partial!('api/short_urls/short_url', short_url: short_url, show_count: false)
  end
end
