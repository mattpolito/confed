class RedirectToMainUriWhenNot
  MAIN_URI = ENV['MAIN_URI']

  def initialize(app)
    @app = app
  end

  def call(env)
    if !MAIN_URI.nil? && env['HTTP_HOST'] != MAIN_URI
      env['HTTP_HOST'] = MAIN_URI
      [301, { 'Location' => Rack::Request.new(env).url,  }, ['Not the main URI, Redirecting...']]
    else
      @app.call(env)
    end
  end
end
