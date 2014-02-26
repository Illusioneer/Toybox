require 'xmpp4r'
include Jabber

client = Client.new(JID::new("hcpdts@gmail.com"))
client.connect
client.auth("h4rp3rc123!")
client.send(Presence.new.set_type(:available))

msg = Message::new(ARGV[0], ARGV[1])
msg.type=:chat
client.send(msg)

#client.close

