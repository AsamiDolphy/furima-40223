# Pin npm packages by running ./bin/importmap

pin "application",preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "price_calc", to: "price_calc.js"
pin "card", to: "card.js"
pin "preview", to: "preview.js"
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin "image_switch", to: "image_switch.js", preload: true
