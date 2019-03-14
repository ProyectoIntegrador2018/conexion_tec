module AuthHelper

  # App's client ID. Register the app in Application Registration Portal to get this value.
	CLIENT_ID = 'b80e9b1b-dc2d-4fa0-af96-9023e7adf38a'

	# App's client secret. Register the app in Application Registration Portal to get this value.
  CLIENT_SECRET = 'estwBFA635@|jdcYGWI89]('

  # Scopes required by the app
  SCOPES = ['openid',
            'profile',
            'offline_access',
            'User.Read',
            'Mail.Read' ]

  # Generates the student login URL
  def get_student_login_url
    client = OAuth2::Client.new(CLIENT_ID,
	                               CLIENT_SECRET,
	                               site: 'https://login.microsoftonline.com',
	                               authorize_url: '/common/oauth2/v2.0/authorize',
	                               token_url: '/common/oauth2/v2.0/token')
    login_url = client.auth_code.authorize_url(redirect_uri: authorize_student_url, scope: SCOPES.join(' '))
  end

  # Exchanges an authorization code for a token
  def get_token_from_code(auth_code, url)
    client = OAuth2::Client.new(CLIENT_ID,
  									             CLIENT_SECRET,
  									             site: 'https://login.microsoftonline.com',
  									             authorize_url: '/common/oauth2/v2.0/authorize',
	                               token_url: '/common/oauth2/v2.0/token')

  	token = client.auth_code.get_token(auth_code, redirect_uri: url, scope: SCOPES.join(' '))
  end
end
