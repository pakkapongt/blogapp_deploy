import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true

import "bootstrap/dist/css/bootstrap.min.css";


// In app/assets/javascripts/application.js or app/javascript/packs/application.js
document.addEventListener("DOMContentLoaded", function () {
    const logoutLink = document.getElementById("logout-link");
  
    if (logoutLink) {
      logoutLink.addEventListener("click", function (event) {
        event.preventDefault(); // Prevent the default link behavior
  
        // Create a form dynamically
        const form = document.createElement("form");
        form.method = "POST";
        form.action = logoutLink.href;
  
        // Create a hidden field for the DELETE method
        const methodField = document.createElement("input");
        methodField.type = "hidden";
        methodField.name = "_method";
        methodField.value = "delete";
        form.appendChild(methodField);
  
        // Append the form to the body and submit it
        document.body.appendChild(form);
        form.submit();
      });
    }
  });
  