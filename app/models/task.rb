# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  checked    :boolean          default(FALSE)
#

class Task < ActiveRecord::Base
end
