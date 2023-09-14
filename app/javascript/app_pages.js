function setupAddRemoveInputClearing()
{
    document.querySelectorAll('.modal').forEach(el => {
        el.addEventListener('hidden.bs.modal', event => {
            const modalEl = event.target;
            const inputField = modalEl.querySelector('.modal-body input[type="number"]');
            inputField.value = "";
        });
    });
}

addEventListener('DOMContentLoaded', (ev) => {
    setupAddRemoveInputClearing();
})

