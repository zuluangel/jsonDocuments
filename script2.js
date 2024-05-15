document.addEventListener('DOMContentLoaded', () => {
    const selectDocument = document.getElementById('documentos');
    const fileInput = document.getElementById('fileInput');
    const tipoDocInput = document.getElementById('tipoDoc');
    const desDocInput = document.getElementById('desDoc');
    const addDocumentBtn = document.getElementById('addDocumentBtn');

    let documentos = [];

    const cargarDocument = () => {
        selectDocument.innerHTML = ''; // Limpiar la lista desplegable

        documentos.forEach((docum) => {
            const option = document.createElement('option');
            option.text = docum.tipodoc;
            option.value = docum.des_tipodoc;
            selectDocument.add(option);
        });
    };

    const loadAndPlayJSON = () => {
        const file = fileInput.files[0];

        if (file) {
            const reader = new FileReader();

            reader.onload = function(e) {
                const content = e.target.result;
                try {
                    const jsonContent = JSON.parse(content);
                    documentos = jsonContent;
                    cargarDocument();
                    document.getElementById('jsonData').value = JSON.stringify(jsonContent, null, 2);
                } catch (error) {
                    alert('El archivo seleccionado no es un JSON válido.');
                }
            };

            reader.readAsText(file);
        } else {
            alert('Por favor, seleccione un archivo JSON.');
        }
    };

    const agregarDocument = () => {
        const tipoDoc = tipoDocInput.value.toUpperCase().trim();
        const desDoc = desDocInput.value.trim();

        let exist = documentos.find(elem => elem.tipodoc === tipoDoc)

        if (exist === 'undefined') {
            if (tipoDoc && desDoc) {
                documentos.push({ tipodoc: tipoDoc, des_tipodoc: desDoc });
                cargarDocument();
                tipoDocInput.value = '';
                desDocInput.value = '';
            } else {
                alert('Por favor, complete los campos Tipo Doc y Descripción Doc.');
            }
            
        } else {
            alert(`This document type already exist as: ${exist.des_tipodoc}`)
        }
    };

    const savingJSON = () => {
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
    };

    fileInput.addEventListener('change', loadAndPlayJSON);
    addDocumentBtn.addEventListener('click', agregarDocument);
    document.querySelector('.save-form').addEventListener('submit', savingJSON);

    loadTiposDocJSON();
});