// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("DOMContentLoaded", function() {
    // Selecciona el notice
    const notice = document.querySelector('.notice');
    
    // Si existe el notice, espera 3 segundos y luego lo oculta
    if (notice) {
      setTimeout(function() {
        notice.style.transition = "opacity 1s";  // Asegura que la transición sea suave
        notice.style.opacity = 0;  // Hace que el notice se desvanezca
  
        // Después de la transición, elimina el notice del DOM
        setTimeout(function() {
          notice.style.display = "none";  // Elimina el notice completamente de la vista
        }, 1000);  // 1 segundo después de que la opacidad llega a 0
      }, 3000);  // 3000 milisegundos = 3 segundos
    }
  });
  