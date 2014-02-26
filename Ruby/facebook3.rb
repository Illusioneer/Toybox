require 'rss'
require 'net/http'
require 'dbus'

d = DBus::SessionBus.instance
o = d.service("org.freedesktop.Notifications").object("/org/freedesktop/Notifications")
o.introspect

i = o["org.freedesktop.Notifications"]

response = RSS::Parser.parse('https://www.facebook.com/feeds/notifications.php?id=598149827&viewer=598149827&key=AWhyICIe_v0yXiyX&format=rss20', false)
checktime = Time.now - 6000
response.items.each do |item|
  if item.pubDate > checktime
    p item.title
    i.Notify('notify.rb', 0, '/home/bryano/Pictures/fb_logo.jpg', item.title, item.description, [], {}, 2000) do |ret, param|
    end

  end
end