RailsAdmin.config do |config|
  config.model User do
    edit do
      field :name do
        label I18n.t "models.user.name"
      end
      field :email do
        label I18n.t "models.user.email"
      end
      field :password do
        label I18n.t "models.user.password"
        view_helper :password_field
      end
      field :password_confirmation do
        label I18n.t "models.user.password_confirmation"
        view_helper :password_field
      end
    end

    create do
      field :name do
        label I18n.t "models.user.name"
      end
      field :email do
        label I18n.t "models.user.email"
      end
      field :password do
        label I18n.t "models.user.password"
        view_helper :password_field
      end
      field :password_confirmation do
        label I18n.t "models.user.password_confirmation"
        view_helper :password_field
      end
    end

    list do
      field :name do
        label I18n.t "models.user.name"
      end
      field :email do
        label I18n.t "models.user.email"
      end
    end

    show do
      field :name do
        label I18n.t "models.user.name"
      end
      field :email do
        label I18n.t "models.user.email"
      end
    end
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                    # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
