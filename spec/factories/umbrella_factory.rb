FactoryBot.define do
  factory :umbrella, class: 'Umbrella' do
    message { 'Cześć, ten mail jest wysłany przeze mne poprzez aplikację Umprella, która pomaga poznać
            swoje mocne strony. Proszę napisz w czym według Ciebie jestem dobra/y, co jest moją mocną stroną.
            Wystarczy danie lub dwa, ale jeśli chcesz napisać więcej, będzie mi bardzo miło. Wszystkie wypowiedzi trafią
            do mnie w formie zanonimizowanej. Anonimowość Twojej wypowiedzi zapewnia aplikacja Umbrella. Dziękiję :)' }
  end
end
