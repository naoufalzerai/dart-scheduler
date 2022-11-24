function editJob(id) {
    data = {
        'name': document.getElementById('name').value,
        'schedule': document.getElementById('schedule').value,
        'enabled': document.getElementById('enabled').checked,
        'script': document.getElementById('script').value,
        'params': document.getElementById('params').value,
        'app': document.getElementById('app').value,
    }
    fetch('/job/'+id,{
        method:'PUT',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data),
    }).then(response=>document.location.replace('/job/'))
}
function deleteJob(id) {
    fetch('/job/'+id,{
        method:'DElETE',
    }).then(response=>document.location.replace('/job/'))
}
function toggleJob(id) {
    fetch('/job/toggle/'+id,{
        method:'POST',
    }).then(response=>document.location.replace('/job/'))
}
function deleteLog(id) {
    fetch('/execution/'+id,{
        method:'DElETE',
    }).then(response=>document.location.replace('/execution/'+id))
}
$(document).ready(function () {
    $('#datagrid').DataTable();
});