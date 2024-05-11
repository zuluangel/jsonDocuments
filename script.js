let departamentos = [];

function cargarDepartamentos() {
    const selectDepartamentos = document.getElementById('departamentos');
    selectDepartamentos.innerHTML = ''; // Limpiar la lista desplegable

    departamentos.forEach(function(depto) {
        var option = document.createElement('option');
        option.text = depto.nom_depto;
        option.value = depto.cod_depto;
        selectDepartamentos.add(option);
    });
}

function loadAndDisplayJSON() {
    const fileInput = document.getElementById('file-input');
    const file = fileInput.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function(event) {
            const content = event.target.result;
            const jsonContent = JSON.parse(content);
            departamentos = jsonContent; // Actualizar la lista de departamentos
            cargarDepartamentos(); // Actualizar la lista desplegable
            document.getElementById('json-data').value = content;
        };

        reader.readAsText(file);
    } else {
        alert('Por favor, seleccione un archivo JSON.');
    }
}

function agregarDepartamento() {
    const codDeptoInput = document.getElementById('cod-depto');
    const nomDeptoInput = document.getElementById('nom-depto');

    const codDepto = codDeptoInput.value.trim();
    const nomDepto = nomDeptoInput.value.trim();

    let existe = departamentos.find(elem => elem.cod_depto === codDepto);

    if (existe === "undefined"){
        if (codDepto && nomDepto) {
            departamentos.push({ cod_depto: codDepto, nom_depto: nomDepto });
            cargarDepartamentos(); // Actualizar la lista desplegable con el nuevo departamento
            codDeptoInput.value = ''; // Limpiar los campos de entrada
            nomDeptoInput.value = '';
        } else {
            alert('Por favor, complete los campos Código de Departamento y Nombre de Departamento.');
        }
    }else{
        alert(`It exist ${existe.nom_depto}`)
    }

  
}

function saveJSON() {
    const jsonData = JSON.stringify(departamentos, null, 2);
    const blob = new Blob([jsonData], { type: 'application/json' });
    const url = URL.createObjectURL(blob);

    const a = document.createElement('a');
    a.href = url;
    a.download = 'departamentos.json';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);

    return false;
}

document.addEventListener("DOMContentLoaded", function() {
    cargarDepartamentos(); // Cargar los departamentos al cargar la página
});