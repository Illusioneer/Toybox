require 'rss'
require 'net/http'

puts "Running facebooker test mode"

response = RSS::Parser.parse('https://www.facebook.com/feeds/notifications.php?id=598149827&viewer=598149827&key=AWhyICIe_v0yXiyX&format=rss20', false)
checktime = Time.now - 6000
response.items.each do |item|
  if item.pubDate > checktime
    #p item.pubDate
    #p checktime
#    dialog = `kdialog --title '#{item.title}' --icon '/home/bryano/Pictures/fb_logo.jpg' --passivepopup '#{item.description}'`
     `kdialog --title '#{item.title}' --icon '/home/bryano/Pictures/fb_logo.jpg' --passivepopup '#{item.description}'`
#     exec("echo $('#{item.description}')")
#    system dialog
#    p item.description
    #p item.title
  end
end