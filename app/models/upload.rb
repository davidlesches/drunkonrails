class Upload < ActiveRecord::Base

  has_attached_file :file, :styles => { medium: "300x300", small: "200x200", thumb: "100x100" }
  attr_accessible :file

end
