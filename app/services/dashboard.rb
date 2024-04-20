class Dashboard
  def initialize(current_user)
    @current_user = current_user
  end

  def active_people_pie_chart
    return {
      active: Person.where(active: true).count,
      inactive: Person.where(active: false).count
    }
  end

  def total_debts
    return Debt.where(person: Person.where(active: true)).sum(:amount)
  end

  def total_payments
    return Payment.where(person: Person.where(active: true)).sum(:amount)
  end

  def balance
    return total_payments - total_debts
  end

  def last_debts
    return Debt.order(created_at: :desc).limit(10).map do |debt|
      [debt.id, debt.amount]
    end
  end

  def last_payments
    return Payment.order(created_at: :desc).limit(10).map do |payment|
      [payment.id, payment.amount]
    end
  end

  def my_people
    return Person.where(user: @current_user).order(:created_at).limit(10)
  end

  def top_person
    return Person.where(active: true).order(balance: :desc).first
  end

  def bottom_person
    return Person.where(active: true).order(balance: :asc).first
  end
end
