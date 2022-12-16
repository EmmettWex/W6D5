class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: { in: ["Black", "Orange", "Gray", "White", "Brown"] }
    validates :name, presence: true
    validates :sex, presence: true, inclusion: { in: ["M","F"] }

    validate :birth_date_cannot_be_in_the_future
    def birth_date_cannot_be_in_the_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "cannot be born in the future\n")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end
end
