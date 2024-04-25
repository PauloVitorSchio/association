class Dashboard

  attr_reader :active_people_pie_chart, :total_debts, :total_payments, :balance, :last_debts, :last_payments,
  :my_people, :top_person, :bottom_person

  def initialize(current_user)
    @current_user = current_user
  end

  def charge
    populate_data
    self
  end

  private

  def populate_data
    set_active_people_pie_chart
    set_total_debts
    set_total_payments
    set_balance
    set_last_debts
    set_last_payments
    set_my_people
    set_top_person
    set_bottom_person
  end

  def set_active_people_pie_chart
    @active_people_pie_chart = {
      active: Person.where(active: true).count,
      inactive: Person.where(active: false).count
    }
  end

  def set_total_debts
    @total_debts = Debt.where(person: Person.where(active: true)).sum(:amount)
  end

  def set_total_payments
    @total_payments = Payment.where(person: Person.where(active: true)).sum(:amount)
  end

  def set_balance
    @balance = @total_payments - @total_debts
  end

  def set_last_debts
    @last_debts = Debt.order(created_at: :desc).limit(10).map do |debt|
      [debt.id, debt.amount]
    end
  end

  def set_last_payments
    @last_payments = Payment.order(created_at: :desc).limit(10).map do |payment|
      [payment.id, payment.amount]
    end
  end

  def set_my_people
    @my_people = Person.where(user: @current_user).order(:created_at).limit(10)
  end

  def set_top_person
    @top_person = Person.where(active: true).order(balance: :desc).first
  end

  def set_bottom_person
    @bottom_person = Person.where(active: true).order(balance: :asc).first
  end
end
