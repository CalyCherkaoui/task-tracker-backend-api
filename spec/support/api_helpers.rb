module ApiHelpers

  def json
    JSON.parse(response.body)
  end

  def login_with_api(user)
    post '/api/v1/login', params: {
      user: {
        username: user.username,
        email: user.email,
        password: user.password
      }
    }
  end

end