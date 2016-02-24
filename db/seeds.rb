# Assuming long list of urls, one per line, in text file named "url_list" placed in db folder


File.foreach("#{Rails.root}/db/url_list.txt").each do |line|
  ShortUrl.create!(url: line.chomp, short: ShortUrl.random_code)
end
