class Payment < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true

  after_save :update_and_cache_balance

  private

  def update_and_cache_balance
    self.person.balance
  end
end
