function editJob(params) {
    fetch('/job/1',{
        method:'PUT',
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