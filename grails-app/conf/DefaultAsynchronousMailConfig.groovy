asynchronous.mail.default.attempt.interval=300000l       // Five minutes
asynchronous.mail.default.max.attempts.count=1
asynchronous.mail.send.repeat.interval=60000l           // One minute
asynchronous.mail.expired.collector.repeat.interval=607000l
asynchronous.mail.messages.at.once=100
asynchronous.mail.send.immediately=false  // since 0.1.2
asynchronous.mail.override=false    // since 0.2.0
asynchronous.mail.clear.after.sent=false    // since 0.2.0
asynchronous.mail.disable=fasle    // since 0.7
asynchronous.mail.useFlushOnSave=true
asynchronous.mail.persistence.provider='hibernate' // Possible values are 'hibernate', 'hibernate4', 'mongodb'
asynchronous.mail.gparsPoolSize=1
asynchronous.mail.newSessionOnImmediateSend=false