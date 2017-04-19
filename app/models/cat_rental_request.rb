class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: ['APPROVED', 'PENDING', 'DENIED']
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat.id)
      .where(<<-SQL, start_date, end_date, id)
        NOT (? > end_date OR ? < start_date) AND id != ?
      SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:no_overlaps] << "Overlapping request"
    end
  end

  def approve!
    unless overlapping_approved_requests.exists?
      ActiveRecord::Base.transaction do
        self.status = 'APPROVED'
        save
        overlapping = []
        overlapping_requests.each {|request| overlapping << request}
        overlapping.each(&:deny!)
      end
    end
  end

  protected

  def deny!
    self.status = 'DENIED'
    save
  end
end
