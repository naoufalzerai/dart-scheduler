function editJob(params) {
    fetch('/job/1',{
        method:'PUT',
    })
}
function deleteJob(id) {
    fetch('/job/'+id,{
        method:'DElETE',
    })
}
function toggleJob(params) {
    fetch('/job/toggle/1',{
        method:'DElETE',
    })
}
function deleteLog(id) {
    fetch('/job/'+id,{
        method:'DElETE',
    })
}