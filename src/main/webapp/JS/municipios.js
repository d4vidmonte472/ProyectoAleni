document.addEventListener('DOMContentLoaded', () => {
       // Cargar y manejar los CSVs
    Promise.all([loadCSV('../CSV/departamentos.csv'), loadCSV('../CSV/municipios.csv')])
        .then(([departamentosCSV, municipiosCSV]) => {
            const departamentos = parseCSV(departamentosCSV);
            const municipios = parseCSV(municipiosCSV, true);

            console.log('Departamentos:', departamentos);  // Depuración
            console.log('Municipios:', municipios);  // Depuración

            // Poblar el selector de departamentos
            populateDepartamentos(departamentos, departamentoSelect);

            // Evento para el selector de departamento
            departamentoSelect.addEventListener('change', () => {
                const selectedDepartamento = departamentoSelect.value;
                
                if (selectedDepartamento) {
                    const filteredMunicipios = municipios.filter(m => m.idDepartamento === selectedDepartamento);
                    console.log('Municipios filtrados (departamento):', filteredMunicipios);  // Depuración
                    populateMunicipios(filteredMunicipios, municipioSelect);
                } else {
                    municipioSelect.innerHTML = '<option value="">Selecciona un municipio</option>'; // Limpia municipios si no hay departamento
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
                    idMunicipio, 
                    municipio: municipio.replace(/\"/g, '').trim(),  // Elimina comillas y espacios
                    idDepartamento: idDepartamento.trim()  // Asegura que no haya espacios extra
                });
            } else {
                const [id, departamento] = values;
                result.push({ 
                    id: id.trim(), 
                    departamento: departamento.replace(/\"/g, '').trim()  // Elimina comillas y espacios
                });
            }
        }
        return result;
    }

    function populateDepartamentos(departamentos, selectElement) {
        selectElement.innerHTML = '<option value="">Selecciona un departamento</option>'; // Limpiar opciones
        departamentos.forEach(dep => {
            const option = document.createElement('option');
            option.value = dep.id;
            option.textContent = dep.departamento;
            selectElement.appendChild(option);
        });
    }

    function populateMunicipios(municipios, selectElement) {
        selectElement.innerHTML = '<option value="">Selecciona un municipio</option>'; // Limpiar municipios actuales
        municipios.forEach(mun => {
            const option = document.createElement('option');
            option.value = mun.idMunicipio;
            option.textContent = mun.municipio;
            selectElement.appendChild(option);
        });
    }


});
