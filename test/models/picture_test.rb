# == Schema Information
#
# Table name: pictures
#
#  id          :bigint           not null, primary key
#  title       :string(255)
#  subtitle    :string(255)
#  image_url   :string(255)
#  width       :integer
#  height      :integer
#  ratio       :float(24)
#  red_value   :integer
#  green_value :integer
#  blue_value  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
