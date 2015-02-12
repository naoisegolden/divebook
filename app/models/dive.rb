# == Schema Information
#
# Table name: dives
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  divesite_id :integer
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Dive < ActiveRecord::Base
  belongs_to :divesite
  belongs_to :user
  has_many   :images

  validates :divesite, :user, presence: true

  before_save :set_date

  private

  def set_date
    self.date = created_at unless date.present?
  end
end
