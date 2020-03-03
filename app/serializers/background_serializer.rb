class BackgroundSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :image
end
