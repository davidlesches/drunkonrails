class Admin::UploadsController < Admin::ApplicationController
  inherit_resources

  def create
    create! { admin_uploads_path }
  end

end
