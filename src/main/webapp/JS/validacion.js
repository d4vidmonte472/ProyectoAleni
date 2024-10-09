// Función para validar el campo de teléfono
function validarTelefono(event) {
    let valor = event.target.value;
    valor = valor.replace(/[^\d]/g, '');  // Reemplaza cualquier carácter que no sea un número
    event.target.value = valor; // Aquí cerramos correctamente la función
}

// Selecciona todos los campos con la clase 'telefono' y aplica la validación
document.querySelectorAll('.telefono').forEach(function(input) {
    input.addEventListener('input', validarTelefono);
});

// Validación de correos electrónicos
const form = document.getElementById('formC'); // Cambia el id aquí
form.addEventListener('submit', function(event) {
    const email = document.getElementById('email').value;
    const confirmEmail = document.getElementById('confirm-email').value;
    
    if (email !== confirmEmail) {
        alert('Los correos electrónicos no coinciden. Por favor, inténtalo de nuevo.');
        event.preventDefault(); // Evita el envío del formulario si los correos no coinciden
    }
});

// Función para minimizar/agrandar secciones
function toggleSection(sectionId) {
    const section = document.getElementById(sectionId);
    section.classList.toggle('minimized');
}
function toggleSection(sectionId) {
    console.log("Se está activando el botón de minimizar para:", sectionId);
    const section = document.getElementById(sectionId);
    section.classList.toggle('minimized');
}