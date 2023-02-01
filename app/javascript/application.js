// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"
import "channels"

// document.querySelectorAll(".message-box")

let message_box = document.querySelector(".message-box")
let user_box = document.querySelector(".user-box")

if (message_box.scrollHeight >= 700 || user_box.scrollHeight >= 700) {
    message_box.classList.add("auto-scrolling")
    user_box.classList.add("auto-scrolling")
}


