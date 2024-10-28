/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', () => {
    const baseURL = window.location.origin;
    const departamentoSelect = document.getElementById('departamento');
    const municipioSelect = document.getElementById('municipio');

    // Obtener valores predeterminados desde los atributos data-selected
    const departamentoPredeterminado = departamentoSelect.getAttribute('data-selected');
    const municipioPredeterminado = municipioSelect.getAttribute('data-selected');

    // Cargar y manejar los CSVs
    Promise.all([
        loadCSV(`${baseURL}/ProyectoAleni/CSV/departamentos.csv`),
        loadCSV(`${baseURL}/ProyectoAleni/CSV/municipios.csv`)
    ]).then(([departamentosCSV, municipiosCSV]) => {
        const departamentos = parseCSV(departamentosCSV);
        const municipios = parseCSV(municipiosCSV, true);

        // Llenar el combo de departamentos y preseleccionar
        populateDepartamentos(departamentos, departamentoSelect, departamentoPredeterminado);

        // Filtrar municipios y preseleccionar
        if (departamentoPredeterminado) {
            const filteredMunicipios = municipios.filter(m => m.idDepartamento === departamentoPredeterminado);
            populateMunicipios(filteredMunicipios, municipioSelect, municipioPredeterminado);
        }

        // Cambiar municipios según el departamento seleccionado
        departamentoSelect.addEventListener('change', () => {
            const selectedDepartamento = departamentoSelect.value;
            const filteredMunicipios = municipios.filter(m => m.idDepartamento === selectedDepartamento);
            populateMunicipios(filteredMunicipios, municipioSelect);
        });
    });

    // Funciones de utilidad para cargar y procesar los CSVs
    async function loadCSV(file) {
        const response = await fetch(file);
        return response.text();
    }

    function parseCSV(data, isMunicipio = false) {
        const lines = data.trim().split('\n');
        return lines.slice(1).map(line => {
            const values = line.split(',');
            return isMunicipio
                ? { idMunicipio: values[0].trim(), municipio: values[1].trim(), idDepartamento: values[2].trim() }
                : { id: values[0].trim(), departamento: values[1].trim() };
        });
    }

    function populateDepartamentos(departamentos, selectElement, selectedValue = '') {
        selectElement.innerHTML = '<option value="">Selecciona un departamento</option>';
        departamentos.forEach(dep => {
            const option = document.createElement('option');
            option.value = dep.id;
            option.textContent = dep.departamento;
            if (dep.id === selectedValue) option.selected = true;
            selectElement.appendChild(option);
        });
    }

    function populateMunicipios(municipios, selectElement, selectedValue = '') {
        selectElement.innerHTML = '<option value="">Selecciona un municipio</option>';
        municipios.forEach(mun => {
            const option = document.createElement('option');
            option.value = mun.idMunicipio;
            option.textContent = mun.municipio;
            if (mun.idMunicipio === selectedValue) option.selected = true;
            selectElement.appendChild(option);
        });
    }
    const zonaSelect = document.getElementById('zona');
    const zonaPredeterminada = zonaSelect.getAttribute('data-selected');

    // Verifica y selecciona el valor predeterminado de la zona
    if (zonaPredeterminada) {
        const optionToSelect = Array.from(zonaSelect.options).find(option => option.value === zonaPredeterminada);
        if (optionToSelect) {
            optionToSelect.selected = true;
        }
    }
});


