/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// validacionUsuario.js
document.getElementById("editarUsuarioForm").addEventListener("submit", function(event) {
    const password = document.querySelector("input[name='password']").value;
    const confirmPassword = document.querySelector("input[name='Cpassword']").value;

    if (password !== confirmPassword) {
        event.preventDefault();  // Detiene el envío del formulario
    alert("Las contraseñas no coinciden");           
        // Muestra el modal de error
        let errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
        errorModal.show();
    }
});