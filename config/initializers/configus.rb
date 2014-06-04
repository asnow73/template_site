Configus.build Rails.env do
  env :production do
    app_title 'ApplicationTitle'
  end

  env :development, parent: :production do
  end

  env :test, parent: :production do
  end
end