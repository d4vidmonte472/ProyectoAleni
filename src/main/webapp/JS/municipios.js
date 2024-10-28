document.addEventListener('DOMContentLoaded', () => {
    const baseURL = window.location.origin;

    // Obtener el valor predeterminado desde el JSP para el proveedor actual
    const departamentoPredeterminado = document.getElementById('departamento').getAttribute('data-selected');
    const municipioPredeterminado = document.getElementById('municipio').getAttribute('data-selected');

    // Cargar y manejar los CSVs
    Promise.all([
        loadCSV(`${baseURL}/ProyectoAleni/CSV/departamentos.csv`), 
        loadCSV(`${baseURL}/ProyectoAleni/CSV/municipios.csv`)
    ])
    .then(([departamentosCSV, municipiosCSV]) => {
        const departamentos = parseCSV(departamentosCSV);
        const municipios = parseCSV(municipiosCSV, true);

        // Llenar el combo de departamentos y preseleccionar el valor predeterminado si existe
        populateDepartamentos(departamentos, departamentoSelect, departamentoPredeterminado);

        // Filtrar municipios para el departamento predeterminado y preseleccionar el municipio
        if (departamentoPredeterminado) {
            const filteredMunicipios = municipios.filter(m => m.idDepartamento === departamentoPredeterminado);
            populateMunicipios(filteredMunicipios, municipioSelect, municipioPredeterminado);
        }

        // Cambiar municipios cuando el usuario selecciona otro departamento
        departamentoSelect.addEventListener('change', () => {
            const selectedDepartamento = departamentoSelect.value;
            if (selectedDepartamento) {
                const filteredMunicipios = municipios.filter(m => m.idDepartamento === selectedDepartamento);
                populateMunicipios(filteredMunicipios, municipioSelect);
            } else {
                municipioSelect.innerHTML = '<option value="">Selecciona un municipio</option>';
            }
        });
    })
    .catch(error => console.error('Error al cargar los archivos CSV:', error));

    const departamentoSelect = document.getElementById('departamento');
    const municipioSelect = document.getElementById('municipio');

    async function loadCSV(file) {
        const response = await fetch(file);
        const data = await response.text();
        return data;
    }

    function parseCSV(data, isMunicipio = false) {
        const lines = data.trim().split('\n');
        const result = [];

        for (let i = 1; i < lines.length; i++) {
            const values = lines[i].split(',');
            if (isMunicipio) {
                const [idMunicipio, municipio, idDepartamento] = values;
                result.push({ 
                    idMunicipio: idMunicipio.trim(), 
                    municipio: municipio.replace(/\"/g, '').trim(),
                    idDepartamento: idDepartamento.trim() 
                });
            } else {
                const [id, departamento] = values;
                result.push({ 
                    id: id.trim(), 
                    departamento: departamento.replace(/\"/g, '').trim()
                });
            }
        }
        return result;
    }

    function populateDepartamentos(departamentos, selectElement, selectedValue = '') {
        selectElement.innerHTML = '<option value="">Selecciona un departamento</option>';
        departamentos.forEach(dep => {
            const option = document.createElement('option');
            option.value = dep.id;
            option.textContent = dep.departamento;
            if (dep.id === selectedValue) option.selected = true;  // Selección predeterminada
            selectElement.appendChild(option);
        });
    }

    function populateMunicipios(municipios, selectElement, selectedValue = '') {
        selectElement.innerHTML = '<option value="">Selecciona un municipio</option>';
        municipios.forEach(mun => {
            const option = document.createElement('option');
            option.value = mun.idMunicipio;
            option.textContent = mun.municipio;
            if (mun.idMunicipio === selectedValue) option.selected = true;  // Selección predeterminada
            selectElement.appendChild(option);
        });
    }
});
