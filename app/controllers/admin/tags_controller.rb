class Admin::TagsController < Admin::ApplicationController
  inherit_resources

  def create
    create! { admin_tags_path }
  end

  def update
    update! { admin_tags_path }
  end

end
