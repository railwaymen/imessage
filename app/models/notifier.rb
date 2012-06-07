class Notifier

  def self.notify(send_to)
    jid = Jabber::JID::new(ENV['FROM'])
    client = Jabber::Client::new(jid)
    client.connect
    client.auth(ENV['PASS'])
    client.send(Jabber::Presence.new.set_type(:available))

    pres = Jabber::Presence.new.set_type(:subscribe).set_to(send_to)
    client.send(pres)

    msg = Jabber::Message::new(send_to, "Hi")
    msg.type=:chat
    client.send(msg)
  end
end
