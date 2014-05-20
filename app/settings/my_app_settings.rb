module MyAppSettings
  @settings =
  {
    :application_title => "ApplicationTitle"
  }

  def MyAppSettings.title
    @settings[:application_title]
  end
end