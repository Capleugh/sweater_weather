class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :api_key
end
