class Cat < ActiveRecord::Base
  COLORS = ["black", "white", "brown"]

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: ["M", "F"] }
  validates :color, inclusion: { in: COLORS }

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    (Time.now.to_i - birth_date.to_time.to_i) / (365 * 24 * 60 * 60)
  end

end
