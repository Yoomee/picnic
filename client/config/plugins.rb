Tramlines.add_plugin(:enquiries)
Tramlines.add_plugin(:events)
Tramlines.add_plugin(:auth)
Tramlines.add_plugin(:locations)
Tramlines.add_plugin(:badges)
Tramlines.add_plugin(:shouts)
Tramlines.add_plugin(:walls)
Tramlines.add_plugin(:notifications)
Tramlines.add_plugin(:ratings)
Tramlines.add_plugin(:adverts)
Tramlines.add_plugin(:friends)
Tramlines.add_plugin(:picnic_auth)
Tramlines.add_plugin(:messages) if RAILS_ENV.to_s == 'test'
Tramlines.add_plugin(:connections)
Tramlines.add_plugin(:referrals)
Tramlines.add_plugin(:content_flags)
