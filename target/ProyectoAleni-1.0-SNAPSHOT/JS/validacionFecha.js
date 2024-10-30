/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener("DOMContentLoaded", function() {
    const fechaInput = document.getElementById("fecha");

    fechaInput.addEventListener("change", function() {
        // Obtener la fecha seleccionada por el usuario
        const selectedDate = new Date(fechaInput.value);
        // Obtener la fecha actual sin la hora
        const today = new Date();
        today.setHours(0, 0, 0, 0);

        // Verificar que la fecha seleccionada no sea futura
        if (selectedDate > today) {
            alert("La fecha no puede ser una fecha futura. Por favor, seleccione una fecha válida.");
            fechaInput.value = ""; // Limpiar el campo de fecha
        }
    });
});