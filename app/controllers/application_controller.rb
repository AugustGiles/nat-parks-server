class ApplicationController < ActionController::API

  def generate_token(user)
    alg = 'HS256'
    secret = '225555c640450b04848c507993ba89426e45029d23c3991d6931cfa6e20985b1a35fc2de39a96bcaebe4c9dcd09112197b943ea96980435eb0b198773c3f3a50'
    payload = { user_id: user.id }
    JWT.encode payload, secret, alg
  end

end
