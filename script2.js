let documentos = [];

function cargarDocument() {
    alert('Cargando')
    const selectDocument = document.getElementById('documentos');
    selectDocument.innerHTML = ''; // Limpiar la lista desplegable

    documentos.forEach(function(dcto) {
        var option = document.createElement('option');
        option.text = dcto.tipodoc;
        option.value = dcto.des_tipodoc;
        selectDocument.add(option);
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
            documentos = jsonContent; // Actualizar la lista de departamentos
            cargarDocument(); // Actualizar la lista desplegable
            document.getElementById('json-data').value = content;
        };

        reader.readAsText(file);
    } else {
        alert('Por favor, seleccione un archivo JSON.');
    }
}

function agregarDocument() {
    const tipoDocumento = document.getElementById('tipoDoc');
    const desDocumento = document.getElementById('desDoc');

    const tipoDoc = tipoDocumento.value.trim();
    const desDoc = desDocumento.value.trim();

    let existe = documentos.find(elem => elem.cod_depto === codDepto);

    if (existe === "undefined"){
        if (tipodoc && desDoc) {
            documentos.push({ tipodoc: tipoDoc, des_tipodoc: desDoc });
            cargarDocument(); // Actualizar la lista desplegable con el nuevo departamento
            tipoDocumento.value = ''; // Limpiar los campos de entrada
            desDocumento.value = '';
        } else {
            alert('Por favor, complete los campos Tipo Doc y Descripción Doc.');
        }
    }else{
        alert(`It exist ${existe.des_tipodoc}`)
    }

  
}

function saveJSON() {
    const jsonData = JSON.stringify(documentos, null, 2);
    const blob = new Blob([jsonData], { type: 'application/json' });
    const url = URL.createObjectURL(blob);

    const a = document.createElement('a');
    a.href = url;
    a.download = 'documentos.json';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);

    return false;
}

document.addEventListener("DOMContentLoaded", function() {
    cargarDocument(); // Cargar los departamentos al cargar la página
});
