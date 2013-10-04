require 'rss'

response = RSS::Parser.parse('https://www.facebook.com/feeds/notifications.php?id=598149827&viewer=598149827&key=AWhyICIe_v0yXiyX&format=rss20', false)
checktime = Time.now - 180

response.items.each do |item|
  if item.pubDate > checktime
    p item.pubDate
    p checktime
    %x(kdialog --title '#{item.title}' --icon '/home/bryano/Pictures/fb_logo.jpg' --passivepopup '#{item.description.gsub(/\n/," ")}')
    p item.title
  end
end
