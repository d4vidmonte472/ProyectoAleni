/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// archivo: preseleccionarDatos.js

document.addEventListener("DOMContentLoaded", function () {
    // Nacionalidad
    const nacionalidadSelect = document.getElementById("nacionalidad");
    const nacionalidadPreseleccionada = nacionalidadSelect.getAttribute("data-selected");
    if (nacionalidadPreseleccionada) {
        nacionalidadSelect.value = nacionalidadPreseleccionada;
    }

    // Tipo de Consumidor
    const tipoConsumidorSelect = document.getElementById("tipoConsumidor");
    const tipoConsumidorPreseleccionado = tipoConsumidorSelect.getAttribute("data-selected");
    if (tipoConsumidorPreseleccionado) {
        tipoConsumidorSelect.value = tipoConsumidorPreseleccionado;
    }

    // Sede DIACO
    const sedeDiacoSelect = document.getElementById("SedeD");
    const sedeDiacoPreseleccionada = sedeDiacoSelect.getAttribute("data-selected");
    if (sedeDiacoPreseleccionada) {
        sedeDiacoSelect.value = sedeDiacoPreseleccionada;
    }
});
s