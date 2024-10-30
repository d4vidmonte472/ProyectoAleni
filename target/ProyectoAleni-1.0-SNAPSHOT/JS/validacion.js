document.addEventListener("DOMContentLoaded", function () {
    const formulario = document.getElementById("formularioQueja");

    // Función para mostrar mensaje de error en el campo
    function mostrarError(input, mensaje) {
        input.classList.add("is-invalid");
        let error = document.createElement("div");
        error.className = "invalid-feedback";
        error.innerText = mensaje;
        input.parentElement.appendChild(error);
    }

    // Función para limpiar todos los mensajes de error
    function limpiarErrores() {
        document.querySelectorAll(".is-invalid").forEach(input => input.classList.remove("is-invalid"));
        document.querySelectorAll(".invalid-feedback").forEach(error => error.remove());
    }

    // Validación de cada campo
    function validarFormulario() {
        let esValido = true;
        limpiarErrores();

        // Validación NIT (solo números)
        const nit = document.getElementById("NIT");
        if (!/^\d+$/.test(nit.value)) {
            mostrarError(nit, "El NIT debe contener solo números.");
            esValido = false;
        }

        // Validación de longitud mínima de nombres y apellidos
        const camposMinimos = [
            { id: "PrimerNombre", min: 3 },
            { id: "SegundoNombre", min: 3 },
            { id: "PrimerApellido", min: 3 },
            { id: "SegundoApellido", min: 3 },
            { id: "ApellidoCasada", min: 3 },
            { id: "empresa", min: 3 },
            { id: "razon-social", min: 3 },
            { id: "direccion", min: 5 },
            { id: "direccionP", min: 5 }
        ];
        camposMinimos.forEach(campo => {
            const input = document.getElementById(campo.id);
            if (input.value.trim().length < campo.min) {
                mostrarError(input, `Debe tener al menos ${campo.min} caracteres.`);
                esValido = false;
            }
        });

        // Validación de email
        const email = document.getElementById("email");
        const emailConfirm = document.getElementById("confirm-email");
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email.value)) {
            mostrarError(email, "El correo electrónico no es válido.");
            esValido = false;
        }
        if (email.value !== emailConfirm.value) {
            mostrarError(emailConfirm, "Los correos electrónicos no coinciden.");
            esValido = false;
        }

        // Validación de teléfonos
        const telefonos = ["TelefonoD", "Celular", "Telr"];
        telefonos.forEach(id => {
            const telefono = document.getElementById(id);
            if (telefono && !/^\d{8}$/.test(telefono.value.trim())) {
                mostrarError(telefono, "El teléfono debe contener 8 dígitos.");
                esValido = false;
            }
        });

        // Validación de fecha no futura
        const fecha = document.getElementById("fecha");
        if (fecha.value) {
            const fechaSeleccionada = new Date(fecha.value);
            const fechaActual = new Date();
            if (fechaSeleccionada > fechaActual) {
                mostrarError(fecha, "La fecha no puede ser en el futuro.");
                esValido = false;
            }
        } else {
            mostrarError(fecha, "La fecha es obligatoria.");
            esValido = false;
        }

        // Validación de otros campos obligatorios
        const otrosCampos = ["NumDoc", "detalle", "solicitud"];
        otrosCampos.forEach(id => {
            const campo = document.getElementById(id);
            if (campo && campo.value.trim() === "") {
                mostrarError(campo, "Este campo es obligatorio.");
                esValido = false;
            }
        });

        return esValido;
    }

    // Evento de envío del formulario
    formulario.addEventListener("submit", function (event) {
        if (!validarFormulario()) {
            event.preventDefault();
        }
    });
});
 document.addEventListener("DOMContentLoaded", function () {
    console.log("JavaScript cargado");

    const formulario = document.getElementById("formularioQueja");

    formulario.addEventListener("submit", function (event) {
        console.log("Intentando enviar el formulario...");

        if (!validarFormulario()) {
            console.log("Validación fallida. Deteniendo el envío del formulario.");
            event.preventDefault();
        } else {
            console.log("Formulario válido. Enviando.");
        }
    });
});