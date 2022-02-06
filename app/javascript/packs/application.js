// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "../css/application"
import "../css/custom"
import "jquery"
import "trix"
import "./text-editor-override"
import "@rails/actiontext"

// import "../dashboard/assets/vendor/@fortawesome/fontawesome-free/css/all"
// import "../dashboard/assets/vendor/nucleo/css/nucleo"
// import "../vendor/prismjs/themes/prism"
// import "../front/css/front"
// import "../vendor/popper.js/dist/umd/popper.min"
// import "../vendor/jquery/dist/jquery.min"
// import "../vendor/headroom.js/dist/headroom.min"
// import "../vendor/onscreen/dist/on-screen.umd.min"
// import "../vendor/waypoints/lib/jquery.waypoints.min"
// import "../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min"
// import "../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
